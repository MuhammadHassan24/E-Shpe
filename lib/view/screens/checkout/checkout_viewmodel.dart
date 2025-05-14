import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:ecommerceapp/services/firebase_DB_services.dart';
import 'package:ecommerceapp/services/stripe_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class CheckoutViewModel extends FutureViewModel<UserModel> {
  final DBServices = locator<FirebaseDbServices>();
  final stripeSer = locator<StripeServices>();

  @override
  Future<UserModel> futureToRun() async {
    return await DBServices.getUserData();
  }

  final shippingFee = 10;

  UserModel? userData;

  String? selectedAddress;

  getSelectedAdress() async {
    final prefs = await SharedPreferences.getInstance();
    selectedAddress = prefs.getString("selected_address") ?? "No Address";
    rebuildUi();
  }
}
