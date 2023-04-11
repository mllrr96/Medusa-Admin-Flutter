import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/store/country.dart';
import '../components/countries.dart';

class SelectCountryController extends GetxController {
  // late bool multipleSelect;
  // late List<Country> selectedCountries;
  // late List<Country> disabledCountries;
  late SelectCountryOptions selectCountryOptions;
  final searchFocusNode = FocusNode();
  final searchCtrl = TextEditingController();
  List<Country> countriesList = [];
  @override
  void onInit() {
    countriesList.addAll(countries);
    selectCountryOptions = Get.arguments ?? const SelectCountryOptions();
    countriesList.sort((a, b) => a.displayName!.toLowerCase().compareTo(b.displayName!.toLowerCase()));
    sort();
    // searchFocusNode.addListener(() {
    //   update();
    // });
    searchCtrl.addListener(() => search());
    super.onInit();
  }

  void sort() {
    countriesList.sort((a, b) {
      if (selectCountryOptions.selectedCountries.contains(a)) {
        return -1;
      }
      return 0;
    });
  }

  @override
  void onClose() {
    searchFocusNode.dispose();
    searchCtrl.dispose();
    super.onClose();
  }

  void search() {
    if (searchCtrl.text.removeAllWhitespace.isNotEmpty) {
      countriesList = countries
          .where(
            (element) =>
                element.displayName!.toLowerCase().contains(searchCtrl.text.toLowerCase()) ||
                element.iso2!.contains(searchCtrl.text) ||
                element.iso3!.contains(searchCtrl.text) ||
                element.iso2 == searchCtrl.text.toLowerCase() ||
                element.iso3 == searchCtrl.text.toLowerCase() ||
                element.numCode == int.tryParse(searchCtrl.text),
          )
          .toList();
    } else {
      countriesList.addAll(countries);
      sort();
    }
    update();
  }
}

class SelectCountryOptions {
  const SelectCountryOptions(
      {this.multipleSelect = false, this.selectedCountries = const [], this.disabledCountriesIso2 = const []});
  final bool multipleSelect;
  final List<Country> selectedCountries;
  final List<String> disabledCountriesIso2;
}
