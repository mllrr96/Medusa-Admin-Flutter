import 'package:auto_route/auto_route.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/data/models/select_country_req.dart';
import 'package:medusa_admin/presentation/widgets/countries/components/countries.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class SelectCountryView extends StatefulWidget {
  const SelectCountryView({super.key, this.selectCountryReq});
  final SelectCountryReq? selectCountryReq;

  @override
  State<SelectCountryView> createState() => _SelectCountryViewState();
}

class _SelectCountryViewState extends State<SelectCountryView> {
  final searchFocusNode = FocusNode();
  final searchCtrl = TextEditingController();
  List<Country> countriesList = [];
  List<Country> selectedCountries = [];
  late SelectCountryReq selectCountryOptions;
  List<String> get disabledCountriesIso =>
      selectCountryOptions.disabledCountriesIso2;
  bool get multipleSelect => selectCountryOptions.multipleSelect;
  @override
  void initState() {
    countriesList.addAll(countries);
    selectCountryOptions = widget.selectCountryReq ?? const SelectCountryReq();
    selectedCountries.addAll(selectCountryOptions.selectedCountries);
    countriesList.sort((a, b) =>
        a.displayName!.toLowerCase().compareTo(b.displayName!.toLowerCase()));
    searchCtrl.addListener(() => search());
    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: multipleSelect
            ? Text(
                'Select Countries ${selectedCountries.isNotEmpty ? '(${selectedCountries.length})' : ''}')
            : const Text('Select Country'),
        actions: [
          TextButton(
              onPressed: selectedCountries.isEmpty
                  ? null
                  : () => context.popRoute(selectedCountries),
              child: const Text('Save'))
        ],
        bottom: PreferredSize(
            preferredSize: selectCountryOptions.disabledCountriesIso2.isNotEmpty
                ? const Size.fromHeight(kToolbarHeight * 2)
                : const Size.fromHeight(kToolbarHeight),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: kToolbarHeight,
                  child: Row(
                    children: [
                      Expanded(
                          child: SearchTextField(
                        hintText:
                            'Search for country name, code, iso2, and iso3',
                        focusNode: searchFocusNode,
                        controller: searchCtrl,
                        fillColor: context.theme.scaffoldBackgroundColor,
                      )),
                      AnimatedCrossFade(
                          firstChild: TextButton(
                              onPressed: () {
                                searchFocusNode.unfocus();
                                searchCtrl.clear();
                                setState(() {});
                              },
                              child: const Text('Cancel')),
                          secondChild: const SizedBox(),
                          crossFadeState: searchFocusNode.hasFocus
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 200))
                    ],
                  ),
                ),
                if (selectCountryOptions.disabledCountriesIso2.isNotEmpty)
                  Container(
                    height: kToolbarHeight,
                    color: context.theme.appBarTheme.backgroundColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.warning_rounded, color: Colors.amber),
                        const SizedBox(width: 6.0),
                        Flexible(
                            child: Text(
                          'Greyed out countries are selected in other regions',
                          style: mediumTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                  ),
              ],
            )),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
          itemCount: countriesList.length,
          itemBuilder: (context, index) {
            final country = countriesList[index];
            return CheckboxListTile(
              value: selectedCountries
                  .map((e) => e.name!)
                  .toList()
                  .contains(country.name),
              enabled: !disabledCountriesIso.contains(country.iso2),
              onChanged: (val) {
                if (multipleSelect) {
                  if (val != null && val) {
                    selectedCountries.add(country);
                  } else if (val != null && !val) {
                    selectedCountries.remove(country);
                  }
                } else {
                  if (val != null && val) {
                    selectedCountries = [country];
                  } else if (val != null && !val) {
                    selectedCountries.remove(country);
                  }
                }
                setState(() {});
              },
              title: Row(
                children: [
                  Flag.fromString(country.iso2!, height: 15, width: 30),
                  Text(country.displayName!),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void sort() {
    countriesList.sort((a, b) {
      if (selectCountryOptions.selectedCountries.contains(a)) {
        return -1;
      }
      return 0;
    });
  }

  void search() {
    if (searchCtrl.text.removeAllWhitespace.isNotEmpty) {
      countriesList = countries
          .where(
            (element) =>
                element.displayName!
                    .toLowerCase()
                    .contains(searchCtrl.text.toLowerCase()) ||
                element.iso2!.contains(searchCtrl.text) ||
                element.iso3!.contains(searchCtrl.text) ||
                element.iso2 == searchCtrl.text.toLowerCase() ||
                element.iso3 == searchCtrl.text.toLowerCase() ||
                element.numCode == int.tryParse(searchCtrl.text),
          )
          .toList();
    } else {
      countriesList.addAll(countries);
      // sort();
    }
    setState(() {});
  }
}
