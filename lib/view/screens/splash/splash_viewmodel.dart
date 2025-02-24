import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/services/firebaseauth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewmodel extends BaseViewModel {
  final navigator = locator<NavigationService>();

// initialize splash screen
  void initialize() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    await checkOnboardSeen();
  }

  final _auth = FirebaseAuthServices();

  Future checkOnboardSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('onboard') ?? false);

    if (seen) {
      await handleState();
    } else {
      await prefs.setBool('onboard', true);
      navigator.navigateTo(Routes.onboardView);
    }
  }

  Future handleState() async {
    _auth.auth.authStateChanges().listen((user) {
      if (user == null) {
        navigateToOnboard();
      } else {
        navigateToNavBar();
      }
    });
  }

  navigateToOnboard() {
    return navigator.replaceWith(
      Routes.onboardView,
    );
  }

  navigateToNavBar() {
    return navigator.replaceWith(
      Routes.navigationBarView,
    );
  }
}
