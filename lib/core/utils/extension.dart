import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../app/data/service/storage_service.dart';
import 'package:timeago/timeago.dart' as timeago;

extension ContextEntension<T> on BuildContext? {
  /// Scroll to current widget
  Future<void> ensureVisibility({Duration? delay}) async {
    if (this == null) return;
    await Future.delayed(delay ?? const Duration(milliseconds: 240))
        .then((value) async {
      await Scrollable.ensureVisible(this!,
          alignment: 0.04, duration: const Duration(milliseconds: 300));
    });
  }
}

extension BuildContextEntension<T> on BuildContext {
  // text styles

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

  // media query
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  double get bottomViewPadding => MediaQuery.of(this).viewPadding.bottom;
  double get bottomViewInsetPadding => MediaQuery.of(this).viewInsets.bottom;
  double get topViewPadding => MediaQuery.of(this).viewPadding.top;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  EdgeInsets get padding => MediaQuery.of(this).padding;

  // TabsRouter get tabsRouter => AutoTabsRouter.of(this);
  int get activeIndex => AutoTabsRouter.of(this).activeIndex;

  // app localization
  AppLocalizations get tr => AppLocalizations.of(this)!;

  // Directionality
  bool get isRTL => Directionality.of(this) == TextDirection.rtl;

  /// Unfocus (Hides keyboard)
  void unfocus() => FocusScope.of(this).unfocus();
}

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

    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(nextInt(chars.length))));
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

extension TextStyleColor on TextStyle {
  TextStyle dark() {
    return copyWith(color: Colors.white);
  }
}

extension FormatPrice on num? {
  String formatAsPrice(String? currencyCode,
      {bool includeSymbol = true,
      bool space = true,
      bool symbolAtEnd = false}) {
    if (this == null || currencyCode == null) {
      return this?.toString() ?? '';
    }
    var value = this!;
    final formatter =
        NumberFormat.simpleCurrency(name: currencyCode.toUpperCase());
    if (formatter.decimalDigits! > 0) {
      value /= pow(10, formatter.decimalDigits!);
    }
    final currencySymbol = formatter.currencySymbol;

    if (includeSymbol) {
      return (!symbolAtEnd ? currencySymbol : '') +
          (space && !symbolAtEnd ? ' ' : '') +
          formatter.format(value).replaceAll(currencySymbol, '') +
          (space && symbolAtEnd ? ' ' : '') +
          (symbolAtEnd ? currencySymbol : '');
    }
    return formatter.format(value).replaceAll(currencySymbol, '');
  }
}

extension FormatDate on DateTime? {
  String formatDate() {
    final format = StorageService.appSettings.dateFormatOptions;
    if (this == null) {
      return '';
    }
    return DateFormat(format.format()).format(this!);
  }

  String formatTime() {
    final format = StorageService.appSettings.timeFormatOptions;
    if (this == null) {
      return '';
    }
    return DateFormat(format.format()).format(this!);
  }

  String timeAgo() {
    if (this == null) {
      return '';
    }
    return timeago.format(this!);
  }
}
