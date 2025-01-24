import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/resources/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewmodel extends BaseViewModel {
  final navigator = locator<NavigationService>();

// initialize splash screen
  void initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    PageTransition.pageTransition(navigator.replaceWith(
      Routes.loginView,
    ));
  }
}
