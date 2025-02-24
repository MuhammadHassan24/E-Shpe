import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product data;
  final VoidCallback onDelete;
  final VoidCallback? onTap;
  const ProductTile({
    super.key,
    required this.onDelete,
    required this.data,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                    color: AppColors.cardBackgroundColors,
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset(data.image)),
            Positioned(
              top: -16,
              right: 0,
              left: 100,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    verticalSpaceMedium,
                    AppText(
                      text: data.name,
                      fontSize: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "\$ ${data.price.toString()}",
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        _addAndRemoveItem(data)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 8,
              child: GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  Icons.delete,
                  color: Colors.black38,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _addAndRemoveItem(Product data) {
    return Container(
      width: 88,
      height: 27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 28,
            child: Icon(Icons.remove),
          ),
          Container(
            width: 28,
            color: AppColors.cardBackgroundColors,
            child: AppText(
              text: data.quantity.toString(),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 28,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
