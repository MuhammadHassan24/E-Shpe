import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/services/cart_services.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  final Function()? onTap;
  final Function()? onTapAdd;

  const ProductCard({
    super.key,
    required this.data,
    this.onTapAdd,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 125,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(data.image.toString())),
                borderRadius: BorderRadius.circular(16),
                color: AppColors.cardBackgroundColors),
          ),
          verticalSpaceSmall,
          AppText(
            text: data.name.toString(),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          verticalSpaceTiny,
          OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: "\$ ${data.price.toString()}",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(onTap: onTapAdd, child: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
