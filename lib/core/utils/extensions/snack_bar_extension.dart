import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message,{
    SnackBarAction? action,
  SnackBarBehavior? style,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        action: action,
        duration: duration,
        showCloseIcon: true,
        dismissDirection: DismissDirection.vertical,
        behavior: style ?? SnackBarBehavior.floating,
      ),
    );
  }
}