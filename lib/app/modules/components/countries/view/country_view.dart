import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import '../controller/country_controller.dart';

class SelectCountryView extends StatelessWidget {
  const SelectCountryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectCountryController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: controller.multipleSelect
                ? Text(
                    'Select Countries ${controller.selectedCountries.isNotEmpty ? '(${controller.selectedCountries.length})' : ''}')
                : const Text('Select Country'),
            centerTitle: true,
            actions: [
              AdaptiveButton(
                  onPressed: controller.selectedCountries.isEmpty
                      ? null
                      : () {
                          Get.back(result: controller.selectedCountries);
                        },
                  child: const Text('Save'))
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
                  child: GetPlatform.isIOS
                      ? Row(
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
                        )
                      : const TextField(
                          decoration: InputDecoration(hintText: 'Search for a country'),
                        ),
                )),
          ),
          body: SafeArea(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final country = controller.countriesList[index];
                    return CheckboxListTile(
                      value: controller.selectedCountries.contains(country),
                      onChanged: (val) {
                        if (FocusScope.of(context).hasFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        if (controller.multipleSelect) {
                          if (val != null && val) {
                            controller.selectedCountries.add(country);
                          } else if (val != null && !val) {
                            controller.selectedCountries.remove(country);
                          }
                        } else {
                          if (val != null && val) {
                            controller.selectedCountries = [country];
                          } else if (val != null && !val) {
                            controller.selectedCountries.remove(country);
                          }
                        }
                        // controller.countriesList.sort((a, b) {
                        //   if (controller.selectedCountries.contains(a)) {
                        //     return 0;
                        //   }
                        //   return 1;
                        // });

                        controller.update();
                      },
                      title: Text(country.displayName!),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
                  itemCount: controller.countriesList.length)),
        );
      },
    );
  }
}
