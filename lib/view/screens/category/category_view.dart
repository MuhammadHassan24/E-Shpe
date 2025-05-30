import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/resources/app_colors.dart';
import 'package:ecommerceapp/view/screens/category/category_viewmodel.dart';
import 'package:ecommerceapp/widget/app_text.dart';
import 'package:ecommerceapp/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CategoryView extends StatelessWidget {
  final List<Product> data;
  final String title;

  const CategoryView({super.key, required this.data, required this.title});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryViewModel>.reactive(
      viewModelBuilder: () => CategoryViewModel(),
      onViewModelReady: (viewModel) => viewModel.getAddress(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.cardBackgroundColors,
          title: AppText(
            text: title,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.builder(
              padding: const EdgeInsets.only(left: 15, right: 15),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 183,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2),
              itemCount: data.length,
              itemBuilder: (_, index) {
                Product item = data[index];
                return ProductCard(
                  onTap: () => viewModel.navigateToDetailView(item),
                  onTapAdd: () =>
                      viewModel.cartServices.addToCart(item, context),
                  data: item,
                );
              }),
        ),
      ),
    );
  }
}
