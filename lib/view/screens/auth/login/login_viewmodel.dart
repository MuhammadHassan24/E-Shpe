import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/services/firebaseauth_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  final _firebaseAuth = FirebaseAuthServices();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool visibility = true;

  void toggleVisibility() {
    visibility = !visibility;
    rebuildUi();
  }

  submit(email, password) async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      await login(email, password);
      setBusy(false);
      navigator.clearStackAndShow(Routes.navigationBarView);
    }
  }

  login(email, password) async {
    await _firebaseAuth.login(email, password);
    emailController.clear();
    passwordController.clear();
  }

  navigateToSignUp() {
    return navigator.navigateTo(Routes.signUpView);
  }

  navigateToNavBar() {
    return navigator.navigateTo(Routes.navigationBarView);
  }
}
