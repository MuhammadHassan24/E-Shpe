import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ecommerceapp/data/model/product_model.dart';

class HomeViewmodel extends BaseViewModel {
  final navigate = locator<NavigationService>();

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
  navigateToProfile() {
    navigate.navigateTo(
      Routes.profileView,
    );
  }

// navigate to detailview
  navigateToDetail(
    Product data,
  ) {
    return navigate.navigateTo(Routes.detailView,
        arguments: DetailViewArguments(data: data));
  }
}
