import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/view/screens/auth/login/login_viewmodel.dart';
import 'package:ecommerceapp/widget/app_button.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:ecommerceapp/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) {
        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;

        return SafeArea(
          top: false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.only(top: 85, left: 15, right: 15),
              child: SingleChildScrollView(
                physics: isLandscape
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceSmall,
                    const AppText(
                      text: "Welcome back to \nE-Shop",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    verticalSpaceTiny,
                    const AppText(
                      text:
                          "Discover Limitless Choices And Unmatched\nConvenience",
                      fontSize: 16,
                      color: Colors.black38,
                    ),
                    verticalSpaceMedium,
                    Center(child: _buildForm(viewModel)),
                    const SizedBox(
                      height: 40,
                    ),
                    const Center(
                        child: AppText(text: "Or Sign in With", fontSize: 13)),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Container(
                          height: 37,
                          width: 37,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset(
                            "asset/images/google.png",
                            fit: BoxFit.cover,
                            scale: 1.5,
                          ),
                        ),
                        Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.facebook,
                            color: Colors.blue[800],
                            // size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildForm(LoginViewModel viewModel) {
    return Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            AppTextfield(
                width: double.infinity,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                controller: viewModel.emailController,
                hintText: "Email"),
            verticalspaceBetween,
            AppTextfield(
              width: double.infinity,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password is required';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                return null;
              },
              controller: viewModel.passwordController,
              obscureText: viewModel.visibility,
              hintText: "Password",
              suffixIcon: GestureDetector(
                  onTap: () {
                    viewModel.toggleVisibility();
                  },
                  child: Icon(!viewModel.visibility
                      ? Icons.visibility
                      : Icons.visibility_off)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  text: "Forget Password!",
                  fontSize: 14,
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () async {
                await viewModel.submit(viewModel.emailController.text,
                    viewModel.passwordController.text);
              },
              child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: viewModel.isBusy
                          ? AppColors.primaryColor.withValues(
                              alpha: 0.7,
                            )
                          : AppColors.primaryColor),
                  child: Center(
                      child: viewModel.isBusy
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Transform.scale(
                                  scale: 0.5,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Login...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))),
            ),
            verticalspaceBetween,
            AppButton(
                onTap: () {
                  viewModel.navigateToSignUp();
                },
                text: "Create Account",
                textColor: Colors.black,
                color: Colors.transparent,
                height: 55,
                width: double.infinity),
          ],
        ));
  }
}
