import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/services/cart_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final cartServices = locator<CartServices>();

  navigateToDetailView(Product data) {
    return navigation.navigateTo(Routes.detailView,
        arguments: DetailViewArguments(data: data));
  }
}
