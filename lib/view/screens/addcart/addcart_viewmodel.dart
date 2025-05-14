import 'dart:developer';

import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/services/cart_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddcartViewmodel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final cartServices = locator<CartServices>();
  final addressSer = locator<SavedAddressService>();

  initialize() {
    cartServices.calculateTotalPrice();
  }

  onAddQuantity(Product data) {
    cartServices.addQuantity(
      data,
    );
    rebuildUi();
  }

  onRemoveQuantity(Product data) {
    cartServices.reduceQuantity(data);
    rebuildUi();
  }

  // remove from cart and update total price
  removeFromCart(index) async {
    int priceToSubtract = cartServices.addCartItems[index].price;
    cartServices.addCartItems.removeAt(index);
    cartServices.totalPrice -= priceToSubtract;
    rebuildUi();
  }

  Future<bool> addressCheck() async {
    final prefs = await SharedPreferences.getInstance();
    final addressList = prefs.getStringList('addresses');
    final selectedAddress = prefs.getString('selected_address');

    final isSaved = addressList != null &&
        addressList.isNotEmpty &&
        selectedAddress != null &&
        selectedAddress.isNotEmpty;

    log("Address check result: $isSaved");
    return isSaved;
  }

  Future<void> navigateToCheckout(List<Product> orderList,
      {required context}) async {
    final hasAddress = await addressCheck();

    if (!hasAddress) {
      final result = await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text("Address"),
            content: const Text("Please Select your address"),
            actions: [
              TextButton(
                onPressed: () {
                  _navigationService.back(result: "add_address");
                },
                child: const Text("Select Address",
                    style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () {
                  _navigationService.back(result: "cancel");
                },
                child:
                    const Text("Cancel", style: TextStyle(color: Colors.black)),
              ),
            ],
          );
        },
      );

      if (result == "add_address") {
        await _navigationService.navigateTo(Routes.addressView);

        // Re-check after address added/selected
        final addressNowAvailable = await addressCheck();
        if (addressNowAvailable) {
          await _navigationService.navigateTo(
            Routes.checkOutView,
            arguments: CheckOutViewArguments(
                orderList: orderList, totalAmount: cartServices.totalPrice),
          );
          rebuildUi();
        }
      }

      return;
    }

    // Address already exists
    await _navigationService.navigateTo(
      Routes.checkOutView,
      arguments: CheckOutViewArguments(
          orderList: orderList, totalAmount: cartServices.totalPrice),
    );
    rebuildUi();
  }

  void navigateToDetail(Product data) {
    _navigationService.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(data: data),
    );
  }
}
