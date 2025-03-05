import 'package:flutter/material.dart';

extension KeyboardExtn on BuildContext {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
