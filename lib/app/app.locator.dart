// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/cart_services.dart';
import '../services/firebase_db_services.dart';
import '../services/stripe_services.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerSingleton(NavigationService());
  locator.registerSingleton(FirebaseDbServices());
  locator.registerSingleton(CartServices());
  locator.registerSingleton(SavedAddressService());
  locator.registerSingleton(StripeServices());
}
