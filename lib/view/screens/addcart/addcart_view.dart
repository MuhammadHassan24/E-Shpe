import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/data/product/product_detail.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/view/screens/addcart/addcart_viewmodel.dart';
import 'package:ecommerceapp/widget/app_button.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:ecommerceapp/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddcartView extends StatelessWidget {
  const AddcartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddcartViewmodel(),
        onViewModelReady: (viewModel) => viewModel.calculateTotalPrice(),
        builder: (_, viewModel, child) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            appBar: AppBar(
              centerTitle: true,
              title: const AppText(
                text: "AddCart",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            body: addCartItems.isEmpty
                ? const Center(
                    child: AppText(text: "No Product In Cart", fontSize: 16),
                  )
                : ListView.separated(
                    itemCount: addCartItems.length,
                    padding: const EdgeInsets.all(10),
                    separatorBuilder: (context, index) => const Divider(
                          height: 35,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                    itemBuilder: (_, index) {
                      Product data = addCartItems[index];
                      return ProductTile(
                        data: data,
                        onDelete: () => viewModel.removeFromCart(index),
                        onTap: () => viewModel.navigateToDetail(data),
                      );
                    }),
            bottomNavigationBar: addCartItems.isNotEmpty
                ? Container(
                    color: AppColors.cardBackgroundColors,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(text: "Total Price", fontSize: 16),
                            AppText(
                              text: "\$ ${viewModel.totalPrice.toString()}",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        AppButton(
                            onTap: () =>
                                viewModel.navigateToCheckout(addCartItems),
                            text: "CheckOut",
                            width: 200)
                      ],
                    ),
                  )
                : null,
          );
        });
  }
}
