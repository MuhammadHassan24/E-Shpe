import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:ecommerceapp/widget/app_button.dart';
import 'package:ecommerceapp/widget/rating_star.dart';
import 'package:ecommerceapp/view/screens/detail/detail_viewmodel.dart';
import 'package:ecommerceapp/data/model/product_model.dart';

class DetailView extends StatelessWidget {
  final Product data;
  const DetailView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DetailViewmodel(),
      builder: (_, viewModel, child) {
        // Check the orientation
        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;

        return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.cardBackgroundColors,
            ),
            body: SingleChildScrollView(
              physics: isLandscape
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 240,
                    width: double.infinity,
                    color: AppColors.cardBackgroundColors,
                    child: Center(
                      child: Image.asset(data.image),
                    ),
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: data.name,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            GestureDetector(
                              onTap: () => viewModel.removeWishlist(data),
                              child: Icon(
                                viewModel.cartServices.isInWishlist(data)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: viewModel.cartServices.isInWishlist(data)
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceSmall,
                        Text(data.description, style: TextStyle(fontSize: 17)),
                        verticalSpaceMedium,
                        AppText(
                          text: "\$ ${data.price.toString()}",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        verticalSpaceSmall,
                        const StarDisplay(value: 3),
                        verticalSpace(60),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Container(
                            width: 95,
                            height: 27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: const Icon(Icons.remove)),
                                ),
                                Container(
                                  width: 30,
                                  color: AppColors.cardBackgroundColors,
                                  child: const AppText(
                                    text: "1",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const SizedBox(
                                    width: 30,
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceLarge,
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: AppButton(
                      onTap: () {
                        viewModel.cartServices.addToCart(data, context);
                        viewModel.rebuildUi();
                      },
                      text: "Add To Cart",
                      width: 280,
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
