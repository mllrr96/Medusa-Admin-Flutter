import 'package:intl/intl.dart';

extension AppUpdateExtension on String {
  bool higherThan(String other) {
    final latestVersion = int.tryParse(replaceAll(RegExp(r'[^0-9]'), ''));
    final currentVersion =
        int.tryParse(other.replaceAll(RegExp(r'[^0-9]'), ''));
    if (currentVersion != null && latestVersion != null) {
      return latestVersion > currentVersion;
    } else {
      return false;
    }
  }

  String get removeAllWhitespace =>
    replaceAll(RegExp(r'\s'), '');

}

extension CurrencySymbolExtension on String? {
  String get getCurrencySymbol {
    return NumberFormat?.simpleCurrency(name: this?.toUpperCase())
        .currencySymbol;
  }

  bool get isEmail => RegExp(_isEmailRegEx).hasMatch(this ?? '');
  bool get isPhoneNumber => RegExp(_isPhoneNumberRegEx).hasMatch(this ?? '');
  bool get isUrl => RegExp(_isUrlRegEx).hasMatch(this ?? '');
}
const String _isEmailRegEx = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const String _isPhoneNumberRegEx = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
const String _isUrlRegEx = r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$";

