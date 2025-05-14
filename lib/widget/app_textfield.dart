import 'package:ecommerceapp/extension/keyboard_extn.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final Widget? preffixicon;
  final String? Function(String?)? validator;
  final bool obscureText;
  const AppTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.width = 280,
      this.onChanged,
      this.focusNode,
      this.contentPadding,
      this.suffixIcon,
      this.obscureText = false,
      this.preffixicon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onTapOutside: (event) => context.hideKeyboard(),
        validator: validator,
        obscureText: obscureText,
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.black38)),
            suffixIcon: suffixIcon,
            prefixIcon: preffixicon,
            hintText: hintText,
            contentPadding: contentPadding),
      ),
    );
  }
}
