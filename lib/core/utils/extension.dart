import 'dart:math';

import 'package:flutter/material.dart';

// extension PercentSized on double {
//   double get hp => (Get.height * (this/100));
//   double get wp => (Get.width * (this/100));
// }
//
// extension ResponsiveText on double {
//   double get rt => Get.width /100 * (this/3);
// }

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension RandomOfDigits on Random {
  /// Generates a non-negative random integer with a specified number of digits.
  ///
  /// Supports [digitCount] values between 1 and 9 inclusive.
  int nextIntOfDigits(int digitCount) {
    assert(1 <= digitCount && digitCount <= 9);
    int min = digitCount == 1 ? 0 : pow(10, digitCount - 1).round();
    int max = pow(10, digitCount).round();
    return min + nextInt(max - min);
  }

  String getRandomString(int length) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(nextInt(chars.length))));
  }
}

extension ListEquals on List<String> {
  bool listEquals(List<String> b) {
    if (length != b.length) {
      return false;
    }
    final a = toSet().toList();
    final bSorted = b.toSet().toList();
    for (int index = 0; index < a.length; index += 1) {
      if (a[index] != bSorted[index]) {
        return false;
      }
    }
    return true;
  }
}

extension ThemeModeValue on ThemeMode {
  int value() {
    switch (this) {
      case ThemeMode.system:
        return 0;
      case ThemeMode.light:
        return 1;
      case ThemeMode.dark:
        return 2;
    }
  }
}
