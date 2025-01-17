import 'package:flutter/material.dart';

class AppSnackbar {
  static snackBar({required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      elevation: 0,
      duration: const Duration(milliseconds: 800),
      backgroundColor: Colors.grey[200],
      closeIconColor: Colors.black,
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(8),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }
}
