import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/services/cart_services.dart';
import 'package:ecommerceapp/view/screens/home/home_view.dart';
import 'package:ecommerceapp/view/screens/addcart/addcart_view.dart';
import 'package:ecommerceapp/view/screens/search/search_view.dart';
import 'package:ecommerceapp/view/screens/wishlist/wishlist_view.dart';
import 'package:stacked/stacked.dart';

class NavigationBarModel extends IndexTrackingViewModel {
  final cartServices = locator<CartServices>();

  getView(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const SearchView();
      case 2:
        return const AddcartView();
      case 3:
        return const WishlistView();
      default:
        return const HomeView();
    }
  }
}
