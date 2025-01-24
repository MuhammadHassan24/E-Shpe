import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardViewmodel extends BaseViewModel {
  final navigator = locator<NavigationService>();

  int _pageIndex = 0;

  // get page index
  int get page => _pageIndex;

  // set page index
  set page(int value) {
    _pageIndex = value;
    rebuildUi();
  }

// navigate to bottom navigation
  navigateToNavBar() {
    navigator.replaceWith(Routes.navigationBarView);
  }

  navigateToLogin() {
    navigator.replaceWith(Routes.loginView);
  }
}
