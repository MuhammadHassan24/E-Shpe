import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/data/product/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewmodel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  final searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  List<Product> filterItems = [];

  List<Product> result = [];

  void initailize() {
    seacrh(searchController.text.toString());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  navigateToDetail(Product data) {
    return navigator.navigateTo(Routes.detailView,
        arguments: DetailViewArguments(data: data));
  }

  seacrh(String query) {
    result = allProduct
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    filterItems = result;

    rebuildUi();
  }

  lowToHigh(String query) {
    result = allProduct
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    filterItems = result..sort((a, b) => a.price.compareTo(b.price));

    rebuildUi();
  }

  highToLow(String query) {
    result = allProduct
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    filterItems = result..sort((a, b) => b.price.compareTo(a.price));
    rebuildUi();
  }
}
