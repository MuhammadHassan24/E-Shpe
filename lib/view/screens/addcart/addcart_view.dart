import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/view/screens/addcart/addcart_viewmodel.dart';
import 'package:ecommerceapp/widget/app_button.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:ecommerceapp/widget/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddcartView extends StatelessWidget {
  const AddcartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddcartViewmodel(),
        onViewModelReady: (viewModel) =>
            viewModel.cartServices.calculateTotalPrice(),
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
            body: viewModel.cartServices.addCartItems.isEmpty
                ? const Center(
                    child: AppText(text: "No Product In Cart", fontSize: 16),
                  )
                : ListView.separated(
                    itemCount: viewModel.cartServices.addCartItems.length,
                    padding: const EdgeInsets.all(10),
                    separatorBuilder: (context, index) => const Divider(
                          height: 35,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                    itemBuilder: (_, index) {
                      Product data = viewModel.cartServices.addCartItems[index];
                      return CartTile(
                        data: data,
                        onAdd: () {
                          viewModel.cartServices.addQuantity(data);
                          viewModel.rebuildUi();
                        },
                        onDelete: () {
                          viewModel.removeFromCart(index);
                          viewModel.cartServices.calculateTotalPrice();
                        },
                        onRemove: () {
                          viewModel.cartServices.reduceQuantity(data);
                          viewModel.rebuildUi();
                        },
                        onTap: () => viewModel.navigateToDetail(data),
                      );
                    }),
            bottomNavigationBar: viewModel.cartServices.addCartItems.isNotEmpty
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
                              text:
                                  "\$ ${viewModel.cartServices.totalPrice.abs().toString()}",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        AppButton(
                            onTap: () => viewModel.navigateToCheckout(
                                viewModel.cartServices.addCartItems),
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
