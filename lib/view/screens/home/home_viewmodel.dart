import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/services/cart_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ecommerceapp/data/model/product_model.dart';

class HomeViewmodel extends BaseViewModel {
  final navigate = locator<NavigationService>();
  final cartServices = locator<CartServices>();

  CarouselController controllerBanner = CarouselController();
  TextEditingController fieldController = TextEditingController();

  navigateToCategoryView(List<Product> category, String title) {
    return navigate.navigateTo(Routes.categoryView,
        arguments: CategoryViewArguments(data: category, title: title));
  }

  @override
  dispose() {
    fieldController.dispose;
    super.dispose();
  }

// navigate to addcartview
  navigateToAddCart() async {
    await navigate.navigateTo(
      Routes.addcartView,
    );
    rebuildUi();
  }

// navigate to detailview
  navigateToDetail(
    Product data,
  ) {
    navigate.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(data: data),
    );
  }
}
