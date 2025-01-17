import 'package:ecommerceapp/screens/auth/login/login_view.dart';
import 'package:ecommerceapp/screens/auth/singup/signup_view.dart';
import 'package:ecommerceapp/screens/bottomnavigation/navigationbar_view.dart';
import 'package:ecommerceapp/screens/view/addcart/addcart_view.dart';
import 'package:ecommerceapp/screens/view/category/category_view.dart';
import 'package:ecommerceapp/screens/view/checkout/checkout_view.dart';
import 'package:ecommerceapp/screens/view/detail/detail_view.dart';
import 'package:ecommerceapp/screens/view/onboard/onboard_view.dart';
import 'package:ecommerceapp/screens/view/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: OnboardView, initial: true),
  MaterialRoute(page: AddcartView),
  MaterialRoute(
    page: SplashView,
  ),
  MaterialRoute(page: NavigationBarView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: DetailView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: CategoryView),
  MaterialRoute(page: CheckOutView)
], dependencies: [
  Singleton(classType: NavigationService)
])
class App {}
