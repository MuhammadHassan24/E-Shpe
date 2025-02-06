import 'dart:developer';

import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:ecommerceapp/services/firebase_DB_services.dart';
import 'package:stacked/stacked.dart';

class ProfileViewmodel extends FutureViewModel<UserModel> {
  final _DB = locator<FirebaseDbServices>();

  @override
  Future<UserModel> futureToRun() async {
    return await _DB.getUserData();
  }

  @override
  void onError(error) {
    return log("Error: $error");
  }
}
