import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double height;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;
  final double width;

  const AppButton({
    super.key,
    required this.onTap,
    this.height = 45,
    required this.text,
    this.color = AppColors.primaryColor,
    required this.width,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }
}
