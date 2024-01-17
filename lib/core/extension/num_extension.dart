import 'package:intl/intl.dart';
import 'dart:math';

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
