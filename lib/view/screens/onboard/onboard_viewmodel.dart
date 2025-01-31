import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/services/firebaseauth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardViewmodel extends BaseViewModel {
  final navigator = locator<NavigationService>();

  final _auth = FirebaseAuthServices();

  void initialise() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('onboard') ?? false);

    if (_seen) {
      handleState();
    } else {
      await prefs.setBool('onboard', true);
      navigator.navigateTo(Routes.onboardView);
    }
  }

  void handleState() async {
    _auth.auth.authStateChanges().listen((user) {
      if (user == null) {
        navigateToLogin();
      } else {
        navigateToNavBar();
      }
    });
  }

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
