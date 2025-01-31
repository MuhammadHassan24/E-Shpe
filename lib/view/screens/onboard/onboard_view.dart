import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/view/screens/onboard/onboard_viewmodel.dart';
import 'package:ecommerceapp/widget/app_button.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [page1(), page2(), page3()];

    final con = PageController();

    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.initialise(),
        viewModelBuilder: () => OnboardViewmodel(),
        builder: (_, viewModel, child) {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  PageView.builder(
                      controller: con,
                      itemCount: pages.length,
                      onPageChanged: (value) {
                        viewModel.page = value;
                      },
                      itemBuilder: (_, index) {
                        return pages[index];
                      }),
                  Positioned(
                      top: 25,
                      right: 20,
                      child: AppText(
                        text: "Skip",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                        onTap: () {
                          viewModel.navigateToLogin();
                        },
                      )),
                  Positioned(
                    bottom: 55,
                    left: 25,
                    child: Row(
                      children: [
                        for (int i = 0; i < pages.length; i++)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInCubic,
                            margin: const EdgeInsets.only(right: 10),
                            height: 12,
                            width: viewModel.page == i ? 25 : 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: viewModel.page == i
                                  ? AppColors.primaryColor
                                  : AppColors.cardBackgroundColors,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 35,
                    child: IconButton(
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          if (viewModel.page < pages.length - 1) {
                            con.animateToPage(
                              viewModel.page + 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          }
                        },
                        icon: viewModel.page == 2
                            ? AppButton(
                                width: 115,
                                onTap: () {
                                  viewModel.navigateToNavBar();
                                },
                                text: "Get Started",
                              )
                            : const Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Icon(Icons.arrow_forward_ios),
                              )),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget page1() {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: onboardScreens[0]["title"].toString(),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: AppText(
                text: onboardScreens[0]["paragraph"].toString(),
                fontSize: 18,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget page2() {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: onboardScreens[1]["title"].toString(),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: AppText(
                text: onboardScreens[1]["paragraph"].toString(),
                fontSize: 18,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget page3() {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: onboardScreens[2]["title"].toString(),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: AppText(
                text: onboardScreens[2]["paragraph"].toString(),
                fontSize: 18,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, String>> onboardScreens = [
  {
    "title": "Choose Your Product",
    "paragraph": "Explore endless choices and find your perfect product!"
  },
  {
    "title": "Select Payment Method",
    "paragraph": "Smooth payments tailored for your convenience."
  },
  {
    "title": "Deliver At Your Door Step",
    "paragraph": "Fast, secure, and contactless delivery to your doorstep."
  },
];
