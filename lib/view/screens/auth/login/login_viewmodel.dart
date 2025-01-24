import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/services/firebaseauth_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool visibility = true;

  final text = "Discover Limitless Choices And Unmatched\nConvenience";

  void toggleVisibility() {
    visibility = !visibility;
    rebuildUi();
  }

  login(email, password) async {}

  navigateToSignUp() {
    return navigator.navigateTo(Routes.signUpView);
  }

  navigateToNavBar() {
    return navigator.navigateTo(Routes.navigationBarView);
  }
}
