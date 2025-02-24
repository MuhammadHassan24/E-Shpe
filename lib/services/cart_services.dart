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
    int index = addCartItems.indexWhere((e) => e.name == data.name);
    if (index != -1) {
      addCartItems[index].quantity += 1;
      AppSnackbar.snackBar(
          context: context, message: 'Add to cart successfully');
    } else {
      addCartItems.add(Product(
          name: data.name,
          price: data.price,
          description: data.description,
          image: data.image,
          quantity: 1));
      AppSnackbar.snackBar(
          context: context, message: 'Add to cart successfully');
    }
  }

  removeFromCart(Product data) {
    return addCartItems.remove(data);
  }
}
