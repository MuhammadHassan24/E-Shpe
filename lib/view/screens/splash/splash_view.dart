import 'package:ecommerceapp/view/screens/splash/splash_viewmodel.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SplashViewmodel(),
      onViewModelReady: (viewModel) => viewModel.initialize(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: Center(
              child: AppText(
                  text: "E-Shop",
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold)),
        );
      },
    );
  }
}
