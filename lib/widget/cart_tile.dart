import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  final Product data;
  final VoidCallback onDelete;
  final VoidCallback? onTap;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  const CartTile({super.key,
    required this.data,
    required this.onDelete,
    this.onAdd,
    this.onRemove,
    this.onTap,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.data.price * widget.data.quantity;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          children: [
            Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                    color: AppColors.cardBackgroundColors,
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset(widget.data.image)),
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
                      text: widget.data.name,
                      fontSize: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "\$ ${totalPrice.toString()}",
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        Container(
                          width: 88,
                          height: 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 28,
                                child: GestureDetector(
                                    onTap: widget.onRemove,
                                    child: const Icon(Icons.remove)),
                              ),
                              Container(
                                width: 28,
                                color: AppColors.cardBackgroundColors,
                                child: AppText(
                                  text: widget.data.quantity.toString(),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 28,
                                child: GestureDetector(
                                    onTap: widget.onAdd,
                                    child: const Icon(Icons.add)),
                              ),
                            ],
                          ),
                        )
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
                onTap: widget.onDelete,
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

  // Widget _addAndRemoveItem(Product data, CartServices cartServices) {
  //   return Container(
  //     width: 88,
  //     height: 27,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       border: Border.all(color: Colors.black),
  //     ),
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 28,
  //           child: GestureDetector(
  //               onTap: () {
  //                 cartServices.reduceQuantity(data);
  //                 setState(() {});
  //               },
  //               child: Icon(Icons.remove)),
  //         ),
  //         Container(
  //           width: 28,
  //           color: AppColors.cardBackgroundColors,
  //           child: AppText(
  //             text: data.quantity.toString(),
  //             fontSize: 15,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //         SizedBox(
  //           width: 28,
  //           child: GestureDetector(
  //               onTap: () {
  //                 cartServices.addQuantity(data);
  //                 setState(() {});
  //               },
  //               child: Icon(Icons.add)),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
