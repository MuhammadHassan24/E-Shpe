import 'package:ecommerceapp/data/model/category_model.dart';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/data/product/product_detail.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/resources/ui_helper.dart';
import 'package:ecommerceapp/view/screens/home/home_viewmodel.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:ecommerceapp/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewmodel>.reactive(
        viewModelBuilder: () => HomeViewmodel(),
        builder: (_, viewModel, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              automaticallyImplyLeading: false,
              toolbarHeight: 65,
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceTiny,
                  AppText(
                    text: "E-Shop",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  verticalSpaceTiny,
                  AppText(text: "500+ products and categories.", fontSize: 12),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => viewModel.navigateToProfile(context),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 28,
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceTiny,
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: categories.length,
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        Category data = categories[index];
                        return _categroyCart(
                            image: data.image.toString(),
                            title: data.title.toString(),
                            onTap: () {
                              viewModel.navigateToCategoryView(
                                  data.products, data.title);
                            });
                      },
                    ),
                  ),
                  verticalSpaceTiny,
                  SizedBox(
                      height: 145,
                      child: Center(
                        child: CarouselView(
                            controller: viewModel.controllerBanner,
                            itemExtent: 360,
                            itemSnapping: true,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            children: [
                              Image.asset(
                                "asset/images/banner.png",
                              ),
                              Image.asset(
                                "asset/images/banner.png",
                              ),
                              Image.asset(
                                "asset/images/banner.png",
                              ),
                            ]),
                      )),
                  verticalSpaceSmall,
                  const Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: AppText(
                      text: "All Items",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpaceSmall,
                  GridView.builder(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 183,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              crossAxisCount: 2),
                      itemCount: allProduct.length,
                      itemBuilder: (_, index) {
                        Product data = allProduct[index];
                        return ProductCard(
                          onTap: () => viewModel.navigateToDetail(data),
                          onTapToAdd: () =>
                              viewModel.cartServices.addToCart(data, context),
                          data: data,
                        );
                      })
                ],
              ),
            ),
          );
        });
  }

  Widget _categroyCart({
    required String image,
    required String title,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.all(9),
            decoration: BoxDecoration(
                color: AppColors.cardBackgroundColors,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(16)),
            child: Image.asset(image),
          ),
        ),
        AppText(text: title, fontSize: 12, fontWeight: FontWeight.bold)
      ],
    );
  }
}
