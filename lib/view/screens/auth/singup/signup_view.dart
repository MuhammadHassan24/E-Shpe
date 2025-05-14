import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/widget/app_button.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:ecommerceapp/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ecommerceapp/view/screens/auth/singup/signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignUpViewmodel(),
      builder: (context, viewModel, child) {
        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: SingleChildScrollView(
              physics: isLandscape
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  const AppText(
                    text: "Let's create your account",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  verticalSpaceMedium,
                  _buildForm(viewModel, context),
                  verticalSpaceMedium,
                  const Center(
                    child: AppText(
                      text: "-----Or Sign up With-----",
                      fontSize: 13,
                    ),
                  ),
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
        );
      },
    );
  }

  Widget _buildForm(SignUpViewmodel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          AppTextfield(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
            controller: viewModel.nameController,
            hintText: "Name",
            width: double.infinity,
          ),
          verticalspaceBetween,
          AppTextfield(
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
            hintText: "Email",
            width: double.infinity,
          ),
          verticalspaceBetween,
          AppTextfield(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
            suffixIcon: GestureDetector(
                onTap: () {
                  viewModel.toggleVisibility();
                },
                child: Icon(!viewModel.visibility
                    ? Icons.visibility
                    : Icons.visibility_off)),
            controller: viewModel.passwordController,
            hintText: "Password",
            width: double.infinity,
            obscureText: viewModel.visibility,
          ),
          verticalspaceBetween,
          AppTextfield(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Phone number is required';
              }
              if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            controller: viewModel.numberController,
            hintText: "Phone Number",
            width: double.infinity,
          ),
          verticalSpaceLarge,
          AppButton(
            height: 55,
            width: double.infinity,
            text: "Create Account",
            onTap: () async {
              await viewModel.submit(viewModel.emailController.text.toString(),
                  viewModel.passwordController.text.toString(), context);
            },
          ),
        ],
      ),
    );
  }
}
