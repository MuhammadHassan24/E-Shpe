import 'dart:io';

import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/view/screens/settings/settings_viewmodel.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  final UserModel? data;
  final File image;
  const SettingsView({super.key, this.data, required this.image});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => SettingsViewModel(),
        builder: (_, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: AppColors.cardBackgroundColors,
                centerTitle: true,
                title: const AppText(
                  text: "Setting",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            body: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 130,
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      color: AppColors.cardBackgroundColors,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: image == null
                                ? const AssetImage("asset/images/filter.png")
                                : FileImage(image),
                          ),
                          horizontalSpaceSmall,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: data!.name,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              verticalSpaceTiny,
                              AppText(text: data!.email, fontSize: 15),
                            ],
                          ),
                          const SizedBox(
                            width: 90,
                          ),
                          const Icon(
                            Icons.edit_sharp,
                            color: Colors.black38,
                            size: 22,
                          )
                        ],
                      ),
                    )),
                Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Account Setting",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            verticalspaceBetween,
                            _settingMenuTile(
                                "My Address",
                                "Set shopping delivery address",
                                Icon(Icons.location_on_outlined)),
                            _settingMenuTile(
                                "My Cart",
                                "Set shopping delivery address",
                                Icon(Icons.shopping_cart_outlined))
                          ],
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                      ),
                    )),
              ],
            ),
          );
        });
  }

  Widget _settingMenuTile(String title, String subtitle, Icon icon) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
