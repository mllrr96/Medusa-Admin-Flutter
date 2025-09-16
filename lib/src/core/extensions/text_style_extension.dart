import 'package:flutter/material.dart';

extension TextStyleContextEntension<T> on BuildContext {
  // text styles
  // ===================================================================//
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get bodyExtraSmall => bodySmallW500?.copyWith(fontSize: 11);

  TextStyle? get bodyLargeW500 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get bodyMediumW500 => Theme.of(this)
      .textTheme
      .bodyMedium
      ?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get bodySmallW500 =>
      Theme.of(this).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get bodyExtraSmallW500 =>
      bodySmallW500?.copyWith(fontSize: 11, fontWeight: FontWeight.w500);

  TextStyle? get bodyLargeW600 =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get bodyMediumW600 => Theme.of(this)
      .textTheme
      .bodyMedium
      ?.copyWith(fontWeight: FontWeight.w600);
// ===================================================================//
}

extension TextStyleColor on TextStyle {
  TextStyle dark() {
    return copyWith(color: Colors.white);
  }
}
