import 'dart:developer';

import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:ecommerceapp/services/firebase_db_services.dart';
import 'package:ecommerceapp/services/firebaseauth_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewmodel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  final _firebaseAuth = FirebaseAuthServices();
  final _firebaseDB = locator<FirebaseDbServices>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool visibility = true;

  signup(
    email,
    password,
  ) async {
    await _firebaseAuth.signUp(email, password);
    UserModel user = UserModel(
      name: nameController.text,
      email: email,
      password: password,
      number: numberController.text,
    );
    await _firebaseDB.addData(user);
    nameController.clear();
    numberController.clear();
    emailController.clear();
    passwordController.clear();
  }

  submit(email, password, {required context}) async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      await signup(
        email,
        password,
      );
      setBusy(false);
      navigator.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Your account create successfully please login",
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.grey[200],
        closeIconColor: Colors.black,
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(8),
      ));
      log("success");
    } else {
      log("errorrr");
    }
  }

  void toggleVisibility() {
    visibility = !visibility;
    rebuildUi();
  }
}
