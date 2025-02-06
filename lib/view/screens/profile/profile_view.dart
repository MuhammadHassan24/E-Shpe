import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/view/screens/profile/profile_viewmodel.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ProfileViewmodel(),
        builder: (_, viewModel, child) {
          final data = viewModel.data;
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
              child: viewModel.isBusy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpaceMedium,
                        Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                child: Icon(
                                  Icons.image,
                                  size: 40,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.amber,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        verticalSpaceSmall,
                        Center(
                          child: AppText(
                            text: data!.name,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        verticalSpaceSmall,
                        Divider(
                          thickness: 1.5,
                          indent: 20,
                          endIndent: 20,
                        ),
                        verticalSpaceSmall,
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
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
                                  AppText(
                                    text: "Name",
                                    fontSize: 16,
                                  ),
                                  SizedBox(
                                    width: 94,
                                  ),
                                  AppText(
                                    text: data.name,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  AppText(
                                    text: "UserName",
                                    fontSize: 16,
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  AppText(
                                    text: data.username,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              verticalSpaceMedium,
                              Divider(
                                thickness: 1.5,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          );
        });
  }
}
