import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();

  navigateToaddress() {
    navigator.navigateTo(Routes.addressView);
  }
}
