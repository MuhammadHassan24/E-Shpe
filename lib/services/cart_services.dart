import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/widget/app_snackbar.dart';
import 'package:flutter/material.dart';

class CartServices {
  final List<Product> _wishListItems = [];
  List<Product> get wishListItems => _wishListItems;

  final List<Product> _addCartItems = [];
  List<Product> get addCartItems => _addCartItems;

  bool isInWishlist(Product data) {
    return wishListItems.contains(data);
  }

  addAndRemoveWishlist(Product data) {
    if (isInWishlist(data)) {
      wishListItems.remove(data);
    } else {
      wishListItems.add(data);
    }
  }

  addToCart(Product data, BuildContext context) {
    if (addCartItems.contains(data)) {
      return AppSnackbar.snackBar(context: context, message: "Already in Cart");
    } else {
      addCartItems.add(data);
      return AppSnackbar.snackBar(
          context: context, message: "Add To Cart Successfully");
    }
  }

  removeFromCart(Product data) {
    return addCartItems.remove(data);
  }
}
