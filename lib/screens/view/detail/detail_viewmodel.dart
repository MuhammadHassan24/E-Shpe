import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/data/model/product_model.dart';
import 'package:ecommerceapp/data/product/product_detail.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailViewmodel extends BaseViewModel {
  final navigate = locator<NavigationService>();

// add to wishlist
  void addToWishlist(Product data) {
    wishListItems.add(data);
    rebuildUi();
  }

// add product into cart
  void addToCart(Product data) {
    if (addCartItems.contains(data)) {
      print("is already in list");
    } else {
      addCartItems.add(data);
      rebuildUi();
    }
  }

// check if product is in wishlist
  bool isInWishlist(Product product) {
    return wishListItems.contains(product);
  }

// remove from wishlist
  void removeFromWishlist(Product product) {
    wishListItems.remove(product);
    rebuildUi();
  }
}
