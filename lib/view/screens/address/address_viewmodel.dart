import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/services/cart_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddressViewModel extends BaseViewModel {
  final addressSer = locator<SavedAddressService>();
  final navigator = locator<NavigationService>();

  String? groupValue;

  List<String> addresses = [];

  initialize() async {
    addresses = await addressSer.getAddresses();
    rebuildUi();
  }

  TextEditingController fieldCon = TextEditingController();

  Future<void> init() async {
    addresses = await addressSer.getAddresses();
    rebuildUi();
  }

  Future<void> addNewAddress(String address) async {
    await addressSer.addAddress(address);
    fieldCon.clear();
    await init(); // reload list
  }

  Future<void> removeAddress(int index) async {
    addresses.remove(index.toString());
    await addressSer.clearAddresses();
    await init(); // reload list
  }

  Future<void> saveSelectedAddress(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_address', value);
  }

  Future<void> loadSelectedAddress() async {
    final prefs = await SharedPreferences.getInstance();
    groupValue = prefs.getString('selected_address');
    rebuildUi(); // Force UI update
  }
}
