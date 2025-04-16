import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final Color color;
  final Function()? onTap;

  const AppText({
    super.key,
    required this.text,
    required this.fontSize,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
    this.height = 0,
    this.color = AppColors.primaryColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            color: color,
            height: height,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
