import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/region/update_region_use_case.dart';
import 'package:medusa_admin/presentation/blocs/store/store_bloc.dart';
import 'package:medusa_admin/presentation/widgets/countries/controller/country_controller.dart';
import 'package:medusa_admin/presentation/widgets/countries/view/country_view.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import '../../regions/controllers/regions_controller.dart';
import '../controllers/add_region_controller.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class AddRegionView extends StatelessWidget {
  const AddRegionView({super.key, this.region});
  final Region? region;

  @override
  Widget build(BuildContext context) {
    Color manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    const halfSpace = Gap(6);
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      borderSide: BorderSide(color: Colors.grey),
    );
    final currencies = context
        .read<StoreBloc>()
        .state
        .mapOrNull(loaded: (_) => _.store.currencies);
    return GestureDetector(
      onTap: () => context.unfocus(),
      child: GetBuilder<AddRegionController>(
        init: AddRegionController(
            updateRegionUseCase: UpdateRegionUseCase.instance,
            region: region,
            selectedCurrency: currencies
                ?.where((element) => element.code == region!.currencyCode)
                .first),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: controller.updateMode
                  ? const Text('Update Region')
                  : const Text('Add Region'),
              actions: [
                TextButton(
                    onPressed: () async => controller.updateMode
                        ? await controller.updateRegion(context)
                        : await controller.createRegion(context),
                    child: controller.updateMode
                        ? const Text('Update')
                        : const Text('Create'))
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    controller: controller.scrollController,
                    children: [
                      FlexExpansionTile(
                        title: const Text('Details'),
                        initiallyExpanded: true,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text('Add the region details.',
                                        style: smallTextStyle!
                                            .copyWith(color: manatee))),
                              ],
                            ),
                            space,
                            LabeledTextField(
                              label: 'Title',
                              controller: controller.titleCtrl,
                              required: true,
                              hintText: 'Europe',
                              validator: (val) {
                                if (val == null ||
                                    val.removeAllWhitespace.isEmpty) {
                                  return 'Field required';
                                }
                                return null;
                              },
                            ),
                            Row(
                              children: [
                                Text('Currency', style: mediumTextStyle),
                                Text('*',
                                    style: mediumTextStyle!
                                        .copyWith(color: Colors.red)),
                              ],
                            ),
                            halfSpace,
                            DropdownButtonFormField<Currency>(
                              style: context.bodyMedium,
                              validator: (val) {
                                if (val == null) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              items: currencies
                                  ?.map((e) => DropdownMenuItem(
                                      value: e, child: Text(e.name!)))
                                  .toList(),
                              hint: const Text('Choose currency'),
                              value: controller.selectedCurrency,
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
                                  fillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  border: border,
                                  errorBorder: border),
                            ),
                            space,
                            if (controller.updateMode == false)
                              LabeledTextField(
                                label: 'Default Tax Rate',
                                controller: controller.defaultTaxRateCtrl,
                                keyboardType: TextInputType.number,
                                required: true,
                                hintText: '% 25',
                                validator: (val) {
                                  if (val == null ||
                                      val.removeAllWhitespace.isEmpty) {
                                    return 'Field required';
                                  }
                                  return null;
                                },
                              ),
                            // if (!controller.updateMode)
                            //   LabeledTextField(
                            //     label: 'Default Tax Code',
                            //     controller: controller.defaultTextCode,
                            //     keyboardType: TextInputType.number,
                            //     hintText: '1000',
                            //   ),
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
                                // final result = await Get.toNamed(Routes.SELECT_COUNTRY,
                                //     arguments: SelectCountryReq(
                                //       disabledCountriesIso2: controller.updateMode
                                //           ? RegionsController.instance
                                //               .disabledCountriesIso2(excludedRegion: controller.region!)
                                //           : RegionsController.instance.disabledCountriesIso2(),
                                //       multipleSelect: true,
                                //       selectedCountries: [...controller.selectedCountries],
                                //     ));
                                final result = await showBarModalBottomSheet(
                                    context: context,
                                    overlayStyle: context
                                        .theme.appBarTheme.systemOverlayStyle,
                                    backgroundColor:
                                        context.theme.scaffoldBackgroundColor,
                                    builder: (context) => SelectCountryView(
                                            selectCountryReq: SelectCountryReq(
                                          disabledCountriesIso2: controller
                                                  .updateMode
                                              ? RegionsController.instance
                                                  .disabledCountriesIso2(
                                                      excludedRegion:
                                                          controller.region!)
                                              : RegionsController.instance
                                                  .disabledCountriesIso2(),
                                          multipleSelect: true,
                                          selectedCountries: [
                                            ...controller.selectedCountries
                                          ],
                                        )));
                                if (result is List<Country>) {
                                  controller.selectedCountries = result;
                                  controller.update();
                                }
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                hintText:
                                    controller.selectedCountries.isNotEmpty
                                        ? 'Countries'
                                        : 'Choose countries',
                                suffixIcon: controller
                                        .selectedCountries.isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          controller.selectedCountries.clear();
                                          controller.update();
                                        },
                                        icon: const Icon(
                                            CupertinoIcons.clear_circled_solid))
                                    : const Icon(
                                        Icons.arrow_drop_down_outlined),
                                prefixIconConstraints:
                                    const BoxConstraints(minWidth: 48 * 1.5),
                                prefixIcon:
                                    controller.selectedCountries.isNotEmpty
                                        ? Chip(
                                            label: Text(controller
                                                .selectedCountries.length
                                                .toString()),
                                            labelStyle: smallTextStyle,
                                            backgroundColor: Theme.of(context)
                                                .appBarTheme
                                                .backgroundColor,
                                            side: const BorderSide(
                                                color: Colors.transparent),
                                          )
                                        : null,
                                enabledBorder: border,
                                border: border,
                              ),
                            ),
                            space,
                          ],
                        ),
                      ),
                      space,
                      FlexExpansionTile(
                        key: controller.providersExpansionKey,
                        title: const Text('Providers'),
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await controller
                                .providersExpansionKey.currentContext
                                .ensureVisibility();
                          }
                        },
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                        'Add which fulfillment and payment providers should be available in this region.',
                                        style: smallTextStyle.copyWith(
                                            color: manatee))),
                              ],
                            ),
                            space,
                            Row(
                              children: [
                                Text('Payment Providers',
                                    style: mediumTextStyle),
                                Text('*',
                                    style: mediumTextStyle.copyWith(
                                        color: Colors.red)),
                              ],
                            ),
                            halfSpace,
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: controller.paymentProviders != null
                                  ? MultiSelectDropDown<String>(
                                      hintStyle: smallTextStyle,
                                      options: controller.paymentProviders!
                                          .map((e) => ValueItem(
                                              label: e.id ?? 'Unknown',
                                              value: e.id))
                                          .toList(),
                                      inputDecoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(color: Colors.grey),
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                      optionsBackgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      optionTextStyle: context.bodySmall,
                                      onOptionSelected: (List<ValueItem<String>>
                                          selectedOptions) {},
                                    )
                                  : const CircularProgressIndicator.adaptive(),
                            ),
                            space,
                            Row(
                              children: [
                                Text('Fulfillment Providers',
                                    style: mediumTextStyle),
                                Text('*',
                                    style: mediumTextStyle.copyWith(
                                        color: Colors.red)),
                              ],
                            ),
                            halfSpace,
                            // AnimatedSwitcher(
                            //   duration: const Duration(milliseconds: 300),
                            //   child: controller.paymentProviders != null
                            //       ? DropDownMultiSelect(
                            //     hintStyle: mediumTextStyle,
                            //     selected_values_style: smallTextStyle,
                            //     options: controller.paymentProviders!
                            //         .map((e) => e.id ?? '')
                            //         .toList(),
                            //     validator: (val) {
                            //       if (val == null || val.isEmpty) {
                            //         return 'Choose at least one payment providers';
                            //       }
                            //       return '';
                            //     },
                            //     onChanged: (value) {
                            //       controller.selectedPaymentProviders =
                            //           value;
                            //       controller.update();
                            //     },
                            //     selectedValues:
                            //     controller.selectedPaymentProviders,
                            //     whenEmpty: 'Choose payment providers',
                            //     decoration: InputDecoration(
                            //       isDense: true,
                            //       filled: true,
                            //       fillColor: Theme.of(context)
                            //           .scaffoldBackgroundColor,
                            //       border: border,
                            //       enabledBorder: border,
                            //     ),
                            //   )
                            //       : const CircularProgressIndicator.adaptive(),
                            // ),
                            space,
                          ],
                        ),
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
