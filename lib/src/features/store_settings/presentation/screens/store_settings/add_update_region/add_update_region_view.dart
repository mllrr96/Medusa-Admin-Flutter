import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';import 'package:medusa_admin/src/core/extensions/string_extension.dart';
import 'package:medusa_admin/src/features/regions/presentation/bloc/region_crud/region_crud_bloc.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/hide_keyboard.dart';
import 'package:medusa_admin/src/features/store_settings/data/models/select_country_req.dart';
import 'package:medusa_admin/src/features/store_settings/presentation/cubits/payment_providers/payment_providers_cubit.dart';
import 'package:medusa_admin/src/features/store_settings/presentation/widgets/countries/country_view.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

@RoutePage()
class AddUpdateRegionView extends StatefulWidget {
  const AddUpdateRegionView({super.key, this.region});
  final Region? region;

  @override
  State<AddUpdateRegionView> createState() => _AddUpdateRegionViewState();
}

class _AddUpdateRegionViewState extends State<AddUpdateRegionView> {
  bool get updateMode => region != null;
  Region? get region => widget.region;
  late RegionCrudBloc regionCrudBloc;
  late PaymentProvidersCubit paymentProvidersCubit;

  final titleCtrl = TextEditingController();
  final defaultTaxRateCtrl = TextEditingController();
  final defaultTextCode = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<Country> selectedCountries = [];
  List<String> selectedPaymentProviders = [];
  Currency? selectedCurrency;
  final providersExpansionKey = GlobalKey();
  List<Currency>? currencies;
  @override
  void initState() {
    regionCrudBloc = RegionCrudBloc.instance;
    paymentProvidersCubit = PaymentProvidersCubit.instance;
    // currencies = context
    //     .read<StoreBloc>()
    //     .state
    //     .mapOrNull(loaded: (_) => _.store.currencies);
    if (updateMode) {
      titleCtrl.text = region!.name;
      defaultTaxRateCtrl.text = region!.taxRate.toString();
      defaultTextCode.text = region!.taxCode.toString();
      selectedCountries = region!.countries;
      // selectedCurrency = context
      //     .read<StoreBloc>()
      //     .state
      //     .mapOrNull(loaded: (_) => _.store.currencies)
      //     ?.where((element) => element.code == region?.currencyCode)
      //     .firstOrNull;
    }
    super.initState();
  }

  @override
  void dispose() {
    regionCrudBloc.close();
    paymentProvidersCubit.close();
    titleCtrl.dispose();
    defaultTaxRateCtrl.dispose();
    defaultTextCode.dispose();
    super.dispose();
  }

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
    return BlocListener<RegionCrudBloc, RegionCrudState>(
      bloc: regionCrudBloc,
      listener: (context, state) {
        state.maybeMap(
          loading: (_) => loading(),
          error: (error) {
            dismissLoading();
            context.showSnackBar(error.failure.toSnackBarString());
          },
          region: (_) {
            dismissLoading();
            context
                .showSnackBar(updateMode ? 'Region updated' : 'Region added');
            context.maybePop();
          },
          orElse: () => dismissLoading(),
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            title: updateMode
                ? const Text('Update Region')
                : const Text('Add Region'),
            actions: [
              TextButton(
                  onPressed: () async {
                    if (!formKey.currentState!.validate() || !updateMode) {
                      return;
                    }
                    context.unfocus();
                    var countriesIso = <String>[];

                    for (Country country in selectedCountries) {
                      countriesIso.add(country.iso2);
                    }

                    if (updateMode) {
                      regionCrudBloc.add(RegionCrudEvent.update(
                        region!.id,
                        UpdateRegionReq(
                          name: titleCtrl.text,
                          currencyCode: selectedCurrency!.code,
                          countries: countriesIso,
                          // paymentProviderIds: selectedPaymentProviders,
                        ),
                      ));
                    } else {
                      regionCrudBloc.add(RegionCrudEvent.create(
                        CreateRegionReq(
                          name: titleCtrl.text,
                          currencyCode: selectedCurrency!.code!,
                          // taxRate: double.parse(defaultTaxRateCtrl.text),
                          paymentProviders: selectedPaymentProviders,
                          // fulfillmentProviders: [],
                          countries: countriesIso,
                        ),
                      ));
                    }
                  },
                  child:
                      updateMode ? const Text('Update') : const Text('Create'))
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Form(
                key: formKey,
                child: ListView(
                  controller: ScrollController(),
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
                            controller: titleCtrl,
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
                                    value: e, child: Text(e.name ?? '')))
                                .toList(),
                            hint: const Text('Choose currency'),
                            initialValue: selectedCurrency,
                            onChanged: (value) {
                              if (value != null) {
                                selectedCurrency = value;
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
                          if (updateMode == false)
                            LabeledTextField(
                              label: 'Default Tax Rate',
                              controller: defaultTaxRateCtrl,
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
                              if (selectedCountries.isEmpty) {
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
                                        disabledCountriesIso2: [],
                                        // disabledCountriesIso2: controller
                                        //     .updateMode
                                        //     ? RegionsController.instance
                                        //     .disabledCountriesIso2(
                                        //     excludedRegion:
                                        //     controller.region!)
                                        //     : RegionsController.instance
                                        //     .disabledCountriesIso2(),
                                        multipleSelect: true,
                                        selectedCountries: [
                                          ...selectedCountries
                                        ],
                                      )));
                              if (result is List<Country>) {
                                selectedCountries = result;
                                setState(() {});
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              hintText: selectedCountries.isNotEmpty
                                  ? 'Countries'
                                  : 'Choose countries',
                              suffixIcon: selectedCountries.isNotEmpty
                                  ? IconButton(
                                      onPressed: () {
                                        selectedCountries.clear();
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                          CupertinoIcons.clear_circled_solid))
                                  : const Icon(Icons.arrow_drop_down_outlined),
                              prefixIconConstraints:
                                  const BoxConstraints(minWidth: 48 * 1.5),
                              prefixIcon: selectedCountries.isNotEmpty
                                  ? Chip(
                                      label: Text(
                                          selectedCountries.length.toString()),
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
                      key: providersExpansionKey,
                      title: const Text('Providers'),
                      onExpansionChanged: (expanded) async {
                        if (expanded) {
                          await providersExpansionKey.currentContext
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
                              Text('Payment Providers', style: mediumTextStyle),
                              Text('*',
                                  style: mediumTextStyle.copyWith(
                                      color: Colors.red)),
                            ],
                          ),
                          halfSpace,
                          BlocBuilder<PaymentProvidersCubit,
                              PaymentProvidersState>(
                            bloc: paymentProvidersCubit,
                            builder: (context, state) {
                              return SizedBox.shrink();
                              // return state.maybeMap(
                              //     loading: (_) => Skeletonizer(
                              //         enabled: true,
                              //         child: MultiSelectDropDown(
                              //             onOptionSelected: (_) {},
                              //             options: const [])),
                              //     paymentProviders: (_) {
                              //       return MultiSelectDropDown<String>(
                              //         hintStyle: smallTextStyle,
                              //         options: _.paymentProviders
                              //             .map((e) => ValueItem(
                              //                 label: e.id ?? 'Unknown',
                              //                 value: e.id))
                              //             .toList(),
                              //         inputDecoration: BoxDecoration(
                              //           borderRadius:
                              //               BorderRadius.circular(4.0),
                              //           border: Border.all(color: Colors.grey),
                              //           color: Theme.of(context)
                              //               .scaffoldBackgroundColor,
                              //         ),
                              //         optionsBackgroundColor: Theme.of(context)
                              //             .scaffoldBackgroundColor,
                              //         optionTextStyle: context.bodySmall,
                              //         onOptionSelected: (List<ValueItem<String>>
                              //             selectedOptions) {},
                              //       );
                              //     },
                              //     orElse: () => const SizedBox.shrink());
                            },
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
        ),
      ),
    );
  }
}
