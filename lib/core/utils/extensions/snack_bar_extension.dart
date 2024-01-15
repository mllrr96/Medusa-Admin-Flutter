import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(
    String message, {
    SnackBarAction? action,
    SnackBarBehavior? style,
    Duration duration = const Duration(seconds: 4),
  }) {
    // clear all snack-bars before showing new one
    ScaffoldMessenger.of(this).clearSnackBars();
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

  void showSignInErrorSnackBar(
    String message, {
    SnackBarAction? action,
    SnackBarBehavior? style,
    Duration duration = const Duration(seconds: 8),
  }) {
    // clear all snack-bars before showing new one
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error,
              color: theme.colorScheme.error,
            ),
            const Gap(5),
            Expanded(child: Text(message)),
          ],
        ),
        action: action,
        duration: duration,
        showCloseIcon: true,
        dismissDirection: DismissDirection.vertical,
        behavior: style ?? SnackBarBehavior.floating,
      ),
    );
  }
}
