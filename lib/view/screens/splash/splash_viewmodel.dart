import 'dart:developer';
import 'package:ecommerceapp/app/app.locator.dart';
import 'package:ecommerceapp/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewmodel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  final _auth = FirebaseAuth.instance;

// initialize splash screen
  Future<void> initialize() async {
    // Show splash for minimum time
    await Future.delayed(const Duration(milliseconds: 1500));

    // Validate Firebase auth state before proceeding
    await _validateFirebaseAuthState();

    // Now check if user has seen onboarding
    await checkOnboardSeen();
  }

// This method ensures we have a valid Firebase auth state
  Future<void> _validateFirebaseAuthState() async {
    try {
      // Get the current user from local cache

      final User? currentUser = _auth.currentUser;

      // If there's no user, nothing to validate
      if (currentUser == null && currentUser!.isAnonymous) {
        log("No cached user found in Firebase Auth");
        return;
      }

      log("Found cached user in Firebase Auth: ${currentUser.uid}");

      // Try to validate the user by reloading their data from server
      try {
        // This makes a server call to validate the user exists
        await currentUser.reload();
        log("User successfully reloaded from server");
      } catch (e) {
        // If reload fails, the user likely doesn't exist anymore
        log("Error reloading user: $e");
        log("Signing out invalid user...");

        // Force sign out since the user is invalid
        await _auth.signOut();

        // Small delay to ensure signout completes
        await Future.delayed(const Duration(milliseconds: 300));

        // Double-check that signout worked
        if (_auth.currentUser == null) {
          log("Successfully signed out invalid user");
        } else {
          log("WARNING: Failed to sign out invalid user");
        }
      }
    } catch (e) {
      log("Error validating Firebase auth state: $e");
    }
  }

  Future<void> checkOnboardSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Alternative approach: Check for a unique app installation identifier
    String? installId = prefs.getString('install_id');

    // Get onboarding status
    bool seen = (prefs.getBool('onboard') ?? false);

    log("Install ID: $installId");
    log("Onboard seen: $seen");

    // If no install ID exists, this is a fresh install
    if (installId == null) {
      // Generate a unique install ID for this installation
      String newInstallId = DateTime.now().millisecondsSinceEpoch.toString();
      await prefs.setString('install_id', newInstallId);

      log("Fresh install detected, showing onboarding");
      await prefs.setBool('onboard', true);
      navigateToOnboard();
      return;
    }

    // If install ID exists but onboard not seen, something went wrong - show onboard
    if (!seen) {
      log("Install ID exists but onboard not seen, showing onboarding");
      await prefs.setBool('onboard', true);
      navigateToOnboard();
      return;
    }

    // Both install ID and onboard flag exist - proceed to auth check
    log("Returning user, checking auth state");
    checkAuthAndNavigate();
  }

// Check auth state once and navigate accordingly
  Future<void> checkAuthAndNavigate() async {
    // Simple check if user is logged in
    final User? currentUser = _auth.currentUser;

    if (currentUser == null) {
      log("User not authenticated, navigating to login");
      navigateToLogin();
    } else {
      // We already validated the user in _validateFirebaseAuthState,
      // so if we still have a currentUser here, it should be valid
      log("User authenticated (${currentUser.uid}), navigating to navbar");
      navigateToNavBar();

      // Set up listener for future auth state changes
      _setupAuthListener();
    }
  }

// Set up listener for auth state changes after initial navigation
  void _setupAuthListener() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        log("Auth state changed: User signed out, navigating to login");
        navigateToOnboard();
      }
      // We don't navigate to navbar here to avoid disrupting the user
      // if they're already using the app
    });
  }

  navigateToLogin() {
    return navigator.replaceWith(Routes.loginView);
  }

  navigateToOnboard() {
    return navigator.replaceWith(
      Routes.onboardView,
    );
  }

  navigateToNavBar() {
    return navigator.replaceWith(
      Routes.navigationBarView,
    );
  }
}
