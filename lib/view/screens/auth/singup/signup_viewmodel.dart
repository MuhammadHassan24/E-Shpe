import 'dart:developer';

import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:ecommerceapp/services/firebase_DB_services.dart';
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

  signup(email, password, context) async {
    await _firebaseAuth.signUp(email, password);
    UserModel _user = UserModel(
      name: nameController.text,
      email: email,
      password: password,
      number: numberController.text,
    );
    await _firebaseDB.addData(_user);
    nameController.clear();
    numberController.clear();
    emailController.clear();
    passwordController.clear();
  }

  submit(email, password, context) async {
    if (formKey.currentState!.validate()) {
      await signup(email, password, context);
    } else {
      log("errorrr");
    }
  }

  void toggleVisibility() {
    visibility = !visibility;
    rebuildUi();
  }
}
