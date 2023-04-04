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
  var countriesList = countries;
  @override
  void onInit() {
    countriesList.sort((a, b) => a.displayName!.toLowerCase().compareTo(b.displayName!.toLowerCase()));

    selectCountryOptions = Get.arguments ?? const SelectCountryOptions();
    // if (Get.arguments != null && Get.arguments is List && (Get.arguments as List).length == 2) {
    //   multipleSelect = Get.arguments[0];
    //   selectedCountries = Get.arguments[1];
    //   countriesList.sort((a, b) => a.displayName!.compareTo(b.displayName!));
    //   // countriesList.sort((a, b) {
    //   //   if (selectedCountries.contains(a)) {
    //   //     return 0 + a.displayName!.compareTo(b.displayName!);
    //   //   }
    //   //   return 1 + a.displayName!.compareTo(b.displayName!);
    //   // });
    // } else {
    //   multipleSelect = false;
    //   selectedCountries = [];
    // }
    searchFocusNode.addListener(() {
      update();
    });
    searchCtrl.addListener(() => search());
    super.onInit();
  }

  @override
  void onClose() {
    searchFocusNode.dispose();
    searchCtrl.dispose();
    super.onClose();
  }

  search() {
    if (searchCtrl.text.removeAllWhitespace.isNotEmpty) {
      countriesList = countriesList
          .where((element) => element.displayName!.toLowerCase().contains(searchCtrl.text.toLowerCase()))
          .toList();
    } else {
      countriesList = countries;
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
