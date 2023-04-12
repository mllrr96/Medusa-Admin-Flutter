import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/country.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/countries/controller/country_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:multiselect/multiselect.dart';
import '../../../../../components/custom_expansion_tile.dart';
import '../../../../../components/custom_text_field.dart';
import '../../regions/controllers/regions_controller.dart';
import '../controllers/add_region_controller.dart';

class AddRegionView extends GetView<AddRegionController> {
  const AddRegionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      borderSide: BorderSide(color: Colors.grey),
    );
    const kDuration = Duration(milliseconds: 300);
    Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then((value) async {
        final box = globalKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0.0;
        final scrollPoint = controller.scrollController.offset + yPosition - context.mediaQuery.padding.top - 56;
        if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController
              .animateTo(scrollPoint - 10, duration: kDuration, curve: Curves.fastOutSlowIn);
        } else {
          await controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
              duration: kDuration, curve: Curves.fastOutSlowIn);
        }
      });
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<AddRegionController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
              title: const Text('Add Region'),
              centerTitle: true,
              actions: [
                AdaptiveButton(
                    onPressed: () async => await controller.createRegion(context), child: const Text('Create'))
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    controller: controller.scrollController,
                    children: [
                      CustomExpansionTile(
                        label: 'Details',
                        required: true,
                        initiallyExpanded: true,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text('Add the region details.',
                                      style: smallTextStyle!.copyWith(color: lightWhite))),
                            ],
                          ),
                          space,
                          LabeledTextField(
                            label: 'Title',
                            controller: controller.titleCtrl,
                            required: true,
                            hintText: 'Europe',
                            validator: (val) {
                              if (val == null || val.removeAllWhitespace.isEmpty) {
                                return 'Field required';
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: [
                              Text('Currency', style: mediumTextStyle),
                              Text('*', style: mediumTextStyle!.copyWith(color: Colors.red)),
                            ],
                          ),
                          halfSpace,
                          DropdownButtonFormField(
                            validator: (val) {
                              if (val == null) {
                                return 'Field is required';
                              }
                              return null;
                            },
                            items: StoreService.store.currencies!
                                .map((e) => DropdownMenuItem(value: e, child: Text(e.name!)))
                                .toList(),
                            hint: const Text('Choose currency'),
                            style: smallTextStyle,
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectedCurrency = value;
                                // controller.selectedOptionsValue[index] = value;
                              }
                            },
                            decoration: InputDecoration(
                                enabledBorder: border,
                                isDense: true,
                                filled: true,
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                                border: border,
                                errorBorder: border),
                          ),
                          space,
                          LabeledTextField(
                            label: 'Default Tax Rate',
                            controller: controller.defaultTaxRateCtrl,
                            required: true,
                            hintText: '% 25',
                            validator: (val) {
                              if (val == null || val.removeAllWhitespace.isEmpty) {
                                return 'Field required';
                              }
                              return null;
                            },
                          ),
                          LabeledTextField(
                            label: 'Default Tax Code',
                            controller: controller.defaultTextCode,
                            hintText: '1000',
                            validator: (val) {
                              if (val == null || val.removeAllWhitespace.isEmpty) {
                                return 'Field required';
                              }
                              return null;
                            },
                          ),
                          LabeledTextField(
                            label: 'Countries',
                            controller: null,
                            readOnly: true,
                            required: true,
                            validator: (val) {
                              if (controller.selectedCountries.isEmpty) {
                                return 'Select at least one country';
                              }

                              return null;
                            },
                            onTap: () async {
                              final result = await Get.toNamed(Routes.SELECT_COUNTRY,
                                  arguments: SelectCountryReq(
                                    disabledCountriesIso2: RegionsController.instance.disabledCountriesIso2(),
                                    multipleSelect: true,
                                    selectedCountries: [...controller.selectedCountries],
                                  ));
                              if (result != null && result is List<Country>) {
                                controller.selectedCountries = result;
                                controller.update();
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).scaffoldBackgroundColor,
                              hintText: controller.selectedCountries.isNotEmpty ? 'Countries' : 'Choose countries',
                              suffixIcon: controller.selectedCountries.isNotEmpty
                                  ? AdaptiveIcon(
                                      onPressed: () {
                                        controller.selectedCountries.clear();
                                        controller.update();
                                      },
                                      icon: const Icon(CupertinoIcons.clear_circled_solid))
                                  : const Icon(Icons.arrow_drop_down_outlined),
                              prefixIconConstraints: const BoxConstraints(minWidth: 48 * 1.5),
                              prefixIcon: controller.selectedCountries.isNotEmpty
                                  ? Chip(
                                      label: Text(controller.selectedCountries.length.toString()),
                                      labelStyle: smallTextStyle,
                                      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                                      side: const BorderSide(color: Colors.transparent),
                                    )
                                  : null,
                              enabledBorder: border,
                              border: border,
                            ),
                          ),
                          space,
                        ],
                      ),
                      space,
                      CustomExpansionTile(
                        key: controller.providersExpansionKey,
                        label: 'Providers',
                        required: true,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.providersExpansionKey);
                          }
                        },
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                      'Add which fulfillment and payment providers should be available in this region.',
                                      style: smallTextStyle.copyWith(color: lightWhite))),
                            ],
                          ),
                          space,
                          Row(
                            children: [
                              Text('Payment Providers', style: mediumTextStyle),
                              Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
                            ],
                          ),
                          halfSpace,
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: controller.paymentProviders != null
                                ? DropDownMultiSelect(
                                    hintStyle: smallTextStyle,
                                    selected_values_style: smallTextStyle,
                                    options: controller.paymentProviders!.map((e) => e.id ?? '').toList(),
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Choose at least one payment providers';
                                      }
                                      return '';
                                    },
                                    onChanged: (value) {
                                      controller.selectedPaymentProviders = value;
                                      controller.update();
                                    },
                                    selectedValues: controller.selectedPaymentProviders,
                                    whenEmpty: 'Choose payment providers',
                                    decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                                      border: border,
                                      enabledBorder: border,
                                    ),
                                  )
                                : const CircularProgressIndicator.adaptive(),
                          ),
                          space,
                          Row(
                            children: [
                              Text('Fulfillment Providers', style: mediumTextStyle),
                              Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
                            ],
                          ),
                          halfSpace,
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: controller.paymentProviders != null
                                ? DropDownMultiSelect(
                                    hintStyle: mediumTextStyle,
                                    selected_values_style: smallTextStyle,
                                    options: controller.paymentProviders!.map((e) => e.id ?? '').toList(),
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Choose at least one payment providers';
                                      }
                                      return '';
                                    },
                                    onChanged: (value) {
                                      controller.selectedPaymentProviders = value;
                                      controller.update();
                                    },
                                    selectedValues: controller.selectedPaymentProviders,
                                    whenEmpty: 'Choose payment providers',
                                    decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                                      border: border,
                                      enabledBorder: border,
                                    ),
                                  )
                                : const CircularProgressIndicator.adaptive(),
                          ),
                          space,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
