import 'package:ecommerceapp/services/cart_services.dart';
import 'package:ecommerceapp/services/firebase_DB_services.dart';
import 'package:ecommerceapp/services/stripe_services.dart';
import 'package:ecommerceapp/view/screens/address/address_view.dart';
import 'package:ecommerceapp/view/screens/auth/login/login_view.dart';
import 'package:ecommerceapp/view/screens/auth/singup/signup_view.dart';
import 'package:ecommerceapp/view/bottomnavigation/navigationbar_view.dart';
import 'package:ecommerceapp/view/screens/addcart/addcart_view.dart';
import 'package:ecommerceapp/view/screens/category/category_view.dart';
import 'package:ecommerceapp/view/screens/checkout/checkout_view.dart';
import 'package:ecommerceapp/view/screens/detail/detail_view.dart';
import 'package:ecommerceapp/view/screens/onboard/onboard_view.dart';
import 'package:ecommerceapp/view/screens/profile/profile_view.dart';
import 'package:ecommerceapp/view/screens/settings/settings_view.dart';
import 'package:ecommerceapp/view/screens/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: OnboardView),
  MaterialRoute(page: AddcartView),
  MaterialRoute(
    page: SplashView,
    initial: true,
  ),
  MaterialRoute(page: NavigationBarView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: DetailView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: CategoryView),
  MaterialRoute(page: CheckOutView),
  MaterialRoute(page: ProfileView),
  MaterialRoute(page: SettingsView),
  MaterialRoute(page: AddressView),
], dependencies: [
  Singleton(classType: NavigationService),
  Singleton(classType: FirebaseDbServices),
  Singleton(classType: CartServices),
  Singleton(classType: SavedAddressService),
  Singleton(classType: StripeServices)
])
class App {}
