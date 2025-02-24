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

  // calculate total price
  void calculateTotalPrice() async {
    totalPrice = cartServices.addCartItems
        .fold(0, (sum, product) => sum + product.price * product.quantity);
    rebuildUi();
  }

  // remove from cart and update total price
  void removeFromCart(index) {
    int priceToSubtract = cartServices.addCartItems[index].price;
    cartServices.addCartItems.removeAt(index);
    totalPrice -= priceToSubtract;
    rebuildUi();
  }

  navigateToCheckout(List<Product> orderList) {
    _navigationService.navigateTo(Routes.checkOutView,
        arguments: CheckOutViewArguments(orderList: orderList));
  }

  void navigateToDetail(Product data) {
    _navigationService.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(data: data),
    );
  }
}
