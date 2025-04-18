import 'dart:developer';
import 'dart:io';

import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:ecommerceapp/services/firebase_DB_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends FutureViewModel<UserModel> {
  final _DB = locator<FirebaseDbServices>();
  final _navigateSer = locator<NavigationService>();

  @override
  Future<UserModel> futureToRun() async {
    return await _DB.getUserData();
  }

  @override
  void onError(error) {
    log("Error in ProfileViewModel: $error");
  }

  File? image;

  Future addImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (img == null) return null;

    image = File(img.path);
    rebuildUi();
  }

  navigateToSettings(UserModel data, File image) {
    _navigateSer.navigateTo(Routes.settingsView,
        arguments: SettingsViewArguments(data: data, image: image));
  }
}
