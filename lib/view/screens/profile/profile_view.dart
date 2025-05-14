import 'dart:io';

import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/view/screens/profile/profile_viewmodel.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        builder: (_, viewModel, child) {
          UserModel? data = viewModel.data;

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.cardBackgroundColors,
              centerTitle: true,
              title: const AppText(
                text: "Account",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      viewModel.navigateToSettings(
                          data!, viewModel.image ?? File(""));
                    },
                    child: const Icon(Icons.settings)),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
            body: SingleChildScrollView(
              physics: isLandscape
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: Skeletonizer(
                enabled: viewModel.isBusy,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceMedium,
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: viewModel.image == null
                                ? const AssetImage("asset/images/filter.png")
                                : FileImage(viewModel.image!),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColors.cardBackgroundColors,
                              child: GestureDetector(
                                onTap: () async {
                                  await viewModel.addImage();
                                },
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    verticalSpaceSmall,
                    Center(
                      child: AppText(
                        text: data?.name ?? 'Loading...',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpaceSmall,
                    const Divider(
                      thickness: 1.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            text: "Profile Information",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          verticalSpaceMedium,
                          Container(
                            height: 65,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: AppColors.cardBackgroundColors,
                            ),
                            child: Row(
                              spacing: 15,
                              children: [
                                const Icon(Icons.person),
                                Column(
                                  spacing: 5,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AppText(
                                      text: "Name",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    AppText(
                                      text: data?.name ?? 'Loading...',
                                      fontSize: 16,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 65,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: AppColors.cardBackgroundColors,
                            ),
                            child: Row(
                              spacing: 15,
                              children: [
                                const Icon(Icons.email_outlined),
                                Column(
                                  spacing: 5,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AppText(
                                      text: "Email",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    AppText(
                                      text: data?.email ?? 'Loading...',
                                      fontSize: 16,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 65,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: AppColors.cardBackgroundColors,
                            ),
                            child: Row(
                              spacing: 15,
                              children: [
                                const Icon(Icons.phone),
                                Column(
                                  spacing: 5,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AppText(
                                      text: "Phone Number",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    AppText(
                                      text: data?.number ?? 'Loading...',
                                      fontSize: 16,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
