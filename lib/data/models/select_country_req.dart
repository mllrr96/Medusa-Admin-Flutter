import 'package:medusa_admin_flutter/medusa_admin.dart';

class SelectCountryReq {
  const SelectCountryReq(
      {this.multipleSelect = false, this.selectedCountries = const [], this.disabledCountriesIso2 = const []});
  final bool multipleSelect;
  final List<Country> selectedCountries;
  final List<String> disabledCountriesIso2;
}
