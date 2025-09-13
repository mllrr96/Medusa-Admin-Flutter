import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:info_popup/info_popup.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/string_extension.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/features/currencies/presentation/cubits/currencies/currencies_cubit.dart';
import 'package:medusa_admin/src/features/regions/data/models/select_country_req.dart';
import 'package:medusa_admin/src/features/regions/presentation/bloc/region_crud/region_crud_bloc.dart';

import 'package:medusa_admin/src/core/utils/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/src/features/store_details/presentation/screens/store_details/store_details_fab.dart';
import 'package:medusa_admin/src/features/store_settings/presentation/widgets/countries/components/countries.dart';
import 'package:medusa_admin/src/features/store_settings/presentation/widgets/countries/country_view.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'components/index.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

@RoutePage()
class RegionDetailsView extends StatefulWidget {
  const RegionDetailsView(this.regionId, {super.key});

  final String regionId;

  @override
  State<RegionDetailsView> createState() => _RegionDetailsViewState();
}

class _RegionDetailsViewState extends State<RegionDetailsView> {
  late RegionCrudBloc regionCrudBloc;
  late RegionCrudBloc regionUpdateBloc;

  // late final PricePreferencesBloc pricePreferencesBloc;
  List<Country> selectedCountries = [];

  @override
  void initState() {
    regionCrudBloc = RegionCrudBloc.instance;
    regionUpdateBloc = RegionCrudBloc.instance;
    regionCrudBloc.add(RegionCrudEvent.load(widget.regionId));
    super.initState();
  }

  @override
  void dispose() {
    regionCrudBloc.close();
    regionUpdateBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return BlocConsumer<RegionCrudBloc, RegionCrudState>(
      bloc: regionCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          deleted: (_) {
            context.showSnackBar('Region deleted');
            context.maybePop();
          },
        );
      },
      builder: (context, state) {
        final regionName = state.maybeWhen(region: (region) => region.name, orElse: () => 'Region');
        final region = state.mapOrNull(region: (region) => region.region);
        return BlocListener<RegionCrudBloc, RegionCrudState>(
          bloc: regionUpdateBloc,
          listener: (context, state) {
            state.whenOrNull(
              loading: () {
                loading();
              },
              error: (message) {
                context.showSnackBar(message.toSnackBarString());
                dismissLoading();
              },
              region: (region) {
                dismissLoading();
                regionCrudBloc.add(RegionCrudEvent.load(region.id));
                context.showSnackBar('Region updated');
                selectedCountries.clear();
                setState(() {});
              },
            );
          },
          child: Scaffold(
            floatingActionButton: selectedCountries.isNotEmpty
                ? StoreDetailsFab(
                    currenciesCount: selectedCountries.length,
                    onClear: () {
                      selectedCountries.clear();
                      setState(() {});
                    },
                    onRemove: () async {
                      if (region == null) {
                        return;
                      }
                      final should = await shouldRemove(selectedCountries.length);
                      if (!should) {
                        return;
                      }
                      final newCountries = region.countries!
                          .where((element) => !selectedCountries.contains(element))
                          .toList();
                      regionUpdateBloc.add(
                        RegionCrudEvent.update(
                          region.id,
                          UpdateRegionReq(
                            countries: newCountries.map((e) => e.iso2).toList(),
                          ),
                        ),
                      );
                    },
                  )
                : null,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MedusaSliverAppBar(
                  title: Text(regionName),
                  actions: [
                    IconButton(
                        icon: const Icon(Icons.more_horiz_outlined),
                        onPressed: () async {
                          if (region == null) {
                            return;
                          }
                          await showModalActionSheet<int>(
                              title: 'Manage $regionName region',
                              context: context,
                              actions: <SheetAction<int>>[
                                const SheetAction(label: 'Edit', key: 0),
                                const SheetAction(
                                    label: 'Delete', isDestructiveAction: true, key: 1),
                              ]).then((result) async {
                            switch (result) {
                              case 0:
                                if (!context.mounted) return;
                                context.pushRoute(AddUpdateRegionRoute(region: region));
                                break;
                              case 1:
                                if (!context.mounted) return;
                                await showTextAnswerDialog(
                                  keyword: region.name,
                                  hintText: region.name,
                                  context: context,
                                  title: 'Delete region?',
                                  message:
                                      'Are you sure you want to delete this region?\n Type the name "${region.name}" to confirm ',
                                  okLabel: 'Yes, confirm',
                                  retryTitle: 'Wrong name',
                                  retryMessage:
                                      'Make sure to type the region name "${region.name}" to confirm deletion',
                                  isDestructiveAction: true,
                                ).then((value) async {
                                  if (value) {
                                    regionCrudBloc.add(RegionCrudEvent.delete(widget.regionId));
                                  }
                                });
                                break;
                            }
                          });
                        })
                  ],
                ),
              ],
              body: state.maybeWhen(
                region: (region) {
                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                    children: [
                      const SizedBox(height: 6.0),
                      FlexExpansionTile(
                        initiallyExpanded: true,
                        trailing: TextButton.icon(
                            onPressed: () async {},
                            icon: Icon(LucideIcons.squarePen),
                            label: Text('Edit')),
                        title: const Text('Region Overview'),
                        childPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Currency'),
                                  Text(region.currencyCode?.toUpperCase() ?? '-'),
                                ],
                              ),
                            ),
                            space,
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Automatic Taxes'),
                                  Text(region.automaticTaxes == true ? 'Enabled' : 'Disabled'),
                                ],
                              ),
                            ),
                            space,
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tax inclusive pricing'),
                                  Text('-'),
                                ],
                              ),
                            ),
                            space,
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Payment Providers'),
                                  Text('-'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      space,
                      if (region.countries != null && region.countries!.isNotEmpty)
                        FlexExpansionTile(
                          initiallyExpanded: true,
                          title: const Text('Currencies'),
                          trailing: TextButton.icon(
                              onPressed: () async {
                                final result = await showBarModalBottomSheet<List<Country>?>(
                                    context: context,
                                    overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                                    backgroundColor: context.theme.scaffoldBackgroundColor,
                                    builder: (context) => SelectCountryView(
                                            selectCountryReq: SelectCountryReq(
                                          disabledCountriesIso2:
                                              region.countries!.map((e) => e.iso2).toList(),
                                          multipleSelect: true,
                                          selectedCountries: [...selectedCountries],
                                        )));
                                if (result is List<Country>) {
                                  regionUpdateBloc.add(
                                    RegionCrudEvent.update(
                                        region.id,
                                        UpdateRegionReq(
                                          countries: [
                                            ...region.countries ?? <Country>[],
                                            ...result,
                                          ].map((e) => e.iso2).toList(),
                                        )),
                                  );
                                }
                              },
                              label: Text('Add Countries'),
                              icon: Icon(LucideIcons.plus)),
                          childPadding:
                              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                          child: Column(
                            children: region.countries!.map((currency) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                  onTap: () {
                                    final isSelected = selectedCountries.contains(currency);
                                    if (isSelected) {
                                      selectedCountries
                                          .removeWhere((element) => element.name == currency.name);
                                    } else {
                                      selectedCountries.add(currency);
                                    }
                                    setState(() {});
                                  },
                                  child: CheckboxListTile(
                                    tileColor: context.theme.scaffoldBackgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    controlAffinity: ListTileControlAffinity.leading,
                                    value: selectedCountries.contains(currency),
                                    onChanged: (bool? value) {
                                      if (value == null) return;
                                      if (!value) {
                                        selectedCountries.removeWhere(
                                            (element) => element.name == currency.name);
                                      } else {
                                        selectedCountries.add(currency);
                                      }
                                      setState(() {});
                                    },
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(currency.name),
                                        Text(currency.iso2.toUpperCase()),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                error: (_) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Error loading region', style: largeTextStyle),
                      TextButton(
                          onPressed: () =>
                              regionCrudBloc.add(RegionCrudEvent.load(widget.regionId)),
                          child: const Text('Retry'))
                    ],
                  ),
                ),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> shouldRemove(int count) async => await showTextAnswerDialog(
        context: context,
        title: 'Are you sure?',
        message:
            'You are about to remove $count country from the region. This action cannot be undone.\nPlease type Remove to confirm:',
        okLabel: 'Remove',
        isDestructiveAction: true,
        keyword: 'Remove',
        retryMessage: 'Please type Remove to confirm',
        retryTitle: 'Wrong input',
      ).then((value) => value);

  String getCountriesText(Region region) {
    if (region.countries?.isEmpty ?? true) {
      return 'No countries configured';
    }
    if (region.countries!.length > 4) {
      String result = '';
      region.countries!.take(4).forEach((element) {
        if (result.isEmpty) {
          result = element.name;
        } else {
          result = '$result, ${element.name}';
        }
      });
      result = '$result +${region.countries!.length - 4}';
      return result;
    } else {
      String result = '';
      for (var element in region.countries!) {
        if (result.isEmpty) {
          result = element.name;
        } else {
          result = '$result, ${element.name}';
        }
      }
      return result;
    }
  }

  String getAllCountriesText(Region region) {
    if (region.countries?.isEmpty ?? true) {
      return 'No countries configured';
    }

    String result = '';
    for (var element in region.countries!) {
      if (result.isEmpty) {
        result = element.name;
      } else {
        result = '$result, ${element.name}';
      }
    }
    return result;
  }

// String getPaymentProviders(Region region) {
//   if (region.paymentProviders == null || region.paymentProviders!.isEmpty) {
//     return 'No payment providers configured';
//   }
//   String paymentProviders = '';
//   for (PaymentProvider payment in region.paymentProviders!) {
//     if (paymentProviders.isNotEmpty) {
//       paymentProviders = '$paymentProviders, ${payment.id}';
//     } else {
//       paymentProviders = payment.id;
//     }
//   }
//   return paymentProviders.capitalize;
// }

// String getFulfilmentProviders(Region region) {
//   String fulfilmentProviders = '';
//   // for (FulfillmentProvider fulfillment in region.fulfillmentProviders) {
//   //   if (fulfilmentProviders.isNotEmpty) {
//   //     fulfilmentProviders = '$fulfilmentProviders, ${fulfillment.id!}';
//   //   } else {
//   //     fulfilmentProviders = fulfillment.id!;
//   //   }
//   // }
//   return fulfilmentProviders.capitalize;
// }
}
