import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/services/cart_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddcartViewmodel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final cartServices = locator<CartServices>();

  double totalPrice = 0;

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
    totalPrice -= priceToSubtract;
    rebuildUi();
  }

  navigateToCheckout(List<Product> orderList) async {
    await _navigationService.navigateTo(Routes.checkOutView,
        arguments: CheckOutViewArguments(orderList: orderList));
    rebuildUi();
  }

  void navigateToDetail(Product data) {
    _navigationService.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(data: data),
    );
  }
}
