import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/data/product/product_detail.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();

  void addToCart(Product data) {
    addCartItems.add(data);
  }

  navigateToDetailView(Product data) {
    return navigation.navigateTo(Routes.detailView,
        arguments: DetailViewArguments(data: data));
  }
}
