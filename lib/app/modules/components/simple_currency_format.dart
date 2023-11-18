import 'dart:math';

import 'package:intl/intl.dart';

String formatPrice(num? price, String? currencyCode,
    {bool includeSymbol = true, bool space = true, bool symbolAtEnd = false}) {
  var value = price;
  final formatter = NumberFormat.simpleCurrency(name: currencyCode?.toUpperCase());
  if (value == null || formatter.decimalDigits == null) {
    return value?.toString() ?? '';
  }
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
