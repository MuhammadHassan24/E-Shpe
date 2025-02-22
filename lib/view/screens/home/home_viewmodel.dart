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
  navigateToProfile(BuildContext context) {
    var begin = 0.1;
    var end = 1.0;
    var curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    navigate.navigateTo(Routes.profileView,
        transition: (context, animation, sconAnimation, child) {
      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    });
  }

// navigate to detailview
  navigateToDetail(
    Product data,
  ) {
    return navigate.navigateTo(Routes.detailView,
        transition: (context, animation, sconAnimation, child) {
      var begin = 0.1;
      var end = 1.0;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    }, arguments: DetailViewArguments(data: data));
  }
}
