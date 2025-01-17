import 'package:ecommerceapp/screens/view/home/home_view.dart';
import 'package:ecommerceapp/screens/view/profile/profile_view.dart';
import 'package:ecommerceapp/screens/view/search/search_view.dart';
import 'package:ecommerceapp/screens/view/wishlist/wishlist_view.dart';
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
