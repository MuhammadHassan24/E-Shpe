import 'package:ecommerceapp/view/screens/home/home_view.dart';
import 'package:ecommerceapp/view/screens/profile/profile_view.dart';
import 'package:ecommerceapp/view/screens/search/search_view.dart';
import 'package:ecommerceapp/view/screens/wishlist/wishlist_view.dart';
import 'package:stacked/stacked.dart';

class NavigationBarModel extends IndexTrackingViewModel {
  getView(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const SearchView();
      case 2:
        return const WishlistView();
      case 3:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }
}
