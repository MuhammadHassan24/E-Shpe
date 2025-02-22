import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/services/cart_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailViewmodel extends BaseViewModel {
  final navigate = locator<NavigationService>();
  final cartServices = locator<CartServices>();
}
