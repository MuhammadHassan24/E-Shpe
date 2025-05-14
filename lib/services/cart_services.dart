import 'dart:developer';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/widget/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartServices {
  int initialQuantity = 1;

  int totalPrice = 0;

  final List<Product> wishListItems = [];

  final List<Product> addCartItems = [];

  bool isInWishlist(Product data) {
    return wishListItems.contains(data);
  }

// add and remove wishlist
  addAndRemoveWishlist(Product data) {
    if (isInWishlist(data)) {
      wishListItems.remove(data);
    } else {
      wishListItems.add(data);
    }
  }

// add to cart
  void addToCart(Product data, BuildContext context) {
    int index = addCartItems.indexWhere((e) => e.name == data.name);

    if (index != -1) {
      if (addCartItems[index].quantity == data.quantity) {
        AppSnackbar.snackBar(
            context: context, message: 'You have reached the maximum quantity');
      } else {
        addCartItems[index].quantity += 1;
        AppSnackbar.snackBar(
            context: context, message: 'Added to cart successfully');
      }
    } else {
      addCartItems.add(Product(
          name: data.name,
          price: data.price,
          description: data.description,
          image: data.image,
          quantity: 1));
      AppSnackbar.snackBar(
          context: context, message: 'Added to cart successfully');
    }
  }

// add product quantity
  addQuantity(Product data) {
    data.quantity += 1;
    log(data.quantity.toString());
    calculateTotalPrice();
  }

// reduce product quantity
  reduceQuantity(Product data) {
    if (data.quantity > 1) {
      data.quantity -= 1;
      log(data.quantity.toString());
      reducePrice();
    }
  }

  // calculate total price with quantity
  void calculateTotalPrice() {
    totalPrice = addCartItems.fold(
        0, (sum, product) => sum + product.price * product.quantity);
  }

// reduce price from total price
  reducePrice() {
    totalPrice = addCartItems.fold(
        0, (sub, product) => sub -= product.price * product.quantity);
  }
}

class SavedAddressService {
  static const _key = 'addresses';

  Future<void> addAddress(String address) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getStringList(_key) ?? [];
    final updated = [...existing, address];
    await prefs.setStringList(
        _key, updated.toSet().toList()); // avoid duplicates
  }

  Future<List<String>> getAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<void> clearAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
