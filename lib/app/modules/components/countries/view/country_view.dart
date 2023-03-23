import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import '../controller/country_controller.dart';
import 'dart:math' as math;

class SelectCountryView extends StatelessWidget {
  const SelectCountryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectCountryController>(
      builder: (controller) {
        var selectedCountries = controller.selectCountryOptions.selectedCountries;
        var disabledCountriesIso = controller.selectCountryOptions.disabledCountriesIso2;
        final multipleSelect = controller.selectCountryOptions.multipleSelect;
        final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: multipleSelect
                    ? Text('Select Countries ${selectedCountries.isNotEmpty ? '(${selectedCountries.length})' : ''}')
                    : const Text('Select Country'),
                centerTitle: true,
                actions: [
                  AdaptiveButton(
                      onPressed: selectedCountries.isEmpty ? null : () => Get.back(result: selectedCountries),
                      child: const Text('Save'))
                ],
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GetPlatform.isIOS
                          ? SizedBox(
                              height: kToolbarHeight,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: CupertinoSearchTextField(
                                    focusNode: controller.searchFocusNode,
                                    controller: controller.searchCtrl,
                                  )),
                                  AnimatedCrossFade(
                                      firstChild: AdaptiveButton(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          onPressed: () {
                                            controller.searchFocusNode.unfocus();
                                          },
                                          child: const Text('Cancel')),
                                      secondChild: const SizedBox(),
                                      crossFadeState: controller.searchFocusNode.hasFocus
                                          ? CrossFadeState.showFirst
                                          : CrossFadeState.showSecond,
                                      duration: const Duration(milliseconds: 200))
                                ],
                              ),
                            )
                          : const TextField(
                              decoration: InputDecoration(hintText: 'Search for a country'),
                            ),
                    )),
              ),
              //TODO: make this persistent header warning when disabledCountries is not empty
              if (controller.selectCountryOptions.disabledCountriesIso2.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.warning_rounded, color: Colors.amber),
                        const SizedBox(width: 6.0),
                        Flexible(
                            child: Text('Greyed out countries are selected in other regions', style: mediumTextStyle)),
                      ],
                    ),
                  ),
                ),
              SliverSafeArea(
                top: false,
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: math.max(0, controller.countriesList.length * 2 - 1), (context, index) {
                  final int itemIndex = index ~/ 2;
                  final country = controller.countriesList[itemIndex];

                  if (index.isOdd) {
                    return const Divider(height: 0, indent: 16.0);
                  }
                  return CheckboxListTile(
                    value: selectedCountries.contains(country),
                    enabled: !disabledCountriesIso.contains(country.iso2),
                    onChanged: (val) {
                      // if (FocusScope.of(context).hasFocus) {
                      //   FocusScope.of(context).unfocus();
                      // }
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
                      // controller.countriesList.sort((a, b) {
                      //   if (controller.selectedCountries.contains(a)) {
                      //     return 0 + a.displayName!.compareTo(b.displayName!);
                      //   }
                      //   return 1 + a.displayName!.compareTo(b.displayName!);
                      // });

                      controller.update();
                    },
                    title: Text(country.displayName!),
                  );
                  // ListView.separated(
                  //     itemBuilder: (context, index) {
                  //
                  //     },
                  //     separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
                  //     itemCount: controller.countriesList.length)
                })),
              )
            ],
          ),
        );
      },
    );
  }
}
