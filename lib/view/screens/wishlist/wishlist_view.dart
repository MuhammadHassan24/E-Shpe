import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/view/screens/wishlist/wishlist_viewmodel.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:ecommerceapp/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => WishlistViewmodel(),
        builder: (_, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.cardBackgroundColors,
              title: const AppText(
                text: "WishList",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            body: viewModel.cartServices.wishListItems.isEmpty
                ? const Center(
                    child: AppText(
                      text: "No Item In Wishlist",
                      fontSize: 16,
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    // shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 183,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2),
                    itemCount: viewModel.cartServices.wishListItems.length,
                    itemBuilder: (_, index) {
                      final data = viewModel.cartServices.wishListItems[index];
                      return ProductCard(
                        onTap: () => viewModel.navigateToDetailView(data),
                        onTapAdd: () =>
                            viewModel.cartServices.addToCart(data, context),
                        data: data,
                      );
                    }),
          );
        });
  }
}
