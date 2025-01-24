import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/data/product/product_detail.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddcartViewmodel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  double totalPrice = 0;

  // calculate total price
  void calculateTotalPrice() {
    totalPrice = addCartItems.fold(0, (sum, product) => sum + product.price);
    rebuildUi();
  }

  // remove from cart and update total price
  void removeFromCart(index) {
    int priceToSubtract = addCartItems[index].price;
    addCartItems.removeAt(index);
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
