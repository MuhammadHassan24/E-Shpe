import 'dart:io';

import 'package:ecommerceapp/data/model/user_model.dart';
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
        fireOnViewModelReadyOnce: true,
        builder: (_, viewModel, child) {
          UserModel? data = viewModel.data;

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const AppText(
                text: "Account",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
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
                                ? AssetImage("asset/images/filter.png")
                                : FileImage(viewModel.image!),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.amber,
                              child: GestureDetector(
                                onTap: () async {
                                  await viewModel.addImage();
                                },
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 18,
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
                      indent: 20,
                      endIndent: 20,
                    ),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Profile Information",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          verticalSpaceMedium,
                          Row(
                            children: [
                              const AppText(
                                text: "Name",
                                fontSize: 16,
                              ),
                              const SizedBox(
                                width: 94,
                              ),
                              AppText(
                                text: data?.name ?? 'Loading...',
                                fontSize: 16,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const AppText(
                                text: "UserName",
                                fontSize: 16,
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              AppText(
                                text: data?.username ?? 'Loading...',
                                fontSize: 16,
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          const Divider(
                            thickness: 1.5,
                          ),
                          verticalSpaceSmall,
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            text: "Personal Information",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          verticalSpaceMedium,
                          Row(
                            children: [
                              const AppText(
                                text: "Email",
                                fontSize: 16,
                              ),
                              const SizedBox(
                                width: 94,
                              ),
                              AppText(
                                text: data?.email ?? 'Loading...',
                                fontSize: 16,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const AppText(
                                text: "Phone Number",
                                fontSize: 16,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              AppText(
                                text: data?.number ?? 'Loading...',
                                fontSize: 16,
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          const Divider(
                            thickness: 1.5,
                          )
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
