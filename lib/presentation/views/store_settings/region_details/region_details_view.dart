import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:info_popup/info_popup.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/data/models/shipping_option_req.dart';
import 'package:medusa_admin/presentation/blocs/region_crud/region_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'components/index.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class RegionDetailsView extends StatefulWidget {
  const RegionDetailsView(this.regionId, {super.key});
  final String regionId;

  @override
  State<RegionDetailsView> createState() => _RegionDetailsViewState();
}

class _RegionDetailsViewState extends State<RegionDetailsView> {
  late RegionCrudBloc regionCrudBloc;

  @override
  void initState() {
    regionCrudBloc = RegionCrudBloc.instance;
    regionCrudBloc.add(RegionCrudEvent.load(widget.regionId));
    super.initState();
  }

  @override
  void dispose() {
    regionCrudBloc.close();
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
        final regionName = state.maybeMap(
            region: (_) => _.region.name!, orElse: () => 'Region');
        final region = state.mapOrNull(region: (region) => region.region);
        return Scaffold(
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
                                  label: 'Delete',
                                  isDestructiveAction: true,
                                  key: 1),
                            ]).then((result) async {
                          switch (result) {
                            case 0:
                              context.pushRoute(AddUpdateRegionRoute(region: region));
                              break;
                            case 1:
                              await showTextAnswerDialog(
                                keyword: region.name!,
                                hintText: region.name!,
                                context: context,
                                title: 'Delete region?',
                                message:
                                    'Are you sure you want to delete this region?\n Type the name "${region.name!}" to confirm ',
                                okLabel: 'Yes, confirm',
                                retryTitle: 'Wrong name',
                                retryMessage:
                                    'Make sure to type the region name "${region.name!}" to confirm deletion',
                                isDestructiveAction: true,
                              ).then((value) async {
                                if (value) {
                                  regionCrudBloc.add(
                                      RegionCrudEvent.delete(widget.regionId));
                                }
                              });
                              break;
                          }
                        });
                      })
                ],
              ),
            ],
            body: state.maybeMap(
              region: (_) {
                final region = _.region;
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 6.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          color: Theme.of(context).cardColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Details',
                              style: Theme.of(context).textTheme.bodyLarge),
                          halfSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Currency',
                                  style: mediumTextStyle!
                                      .copyWith(color: manatee)),
                              Text(
                                  '${region.currencyCode?.toUpperCase() ?? '-'} ${region.currencyCode.getCurrencySymbol}',
                                  style: mediumTextStyle),
                            ],
                          ),
                          halfSpace,
                          InfoPopupWidget(
                            arrowTheme: const InfoPopupArrowTheme(
                              arrowDirection: ArrowDirection.up,
                              color: ColorManager.primary,
                            ),
                            contentTheme: InfoPopupContentTheme(
                              infoContainerBackgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              infoTextStyle: smallTextStyle!,
                              contentPadding: const EdgeInsets.all(8),
                              contentBorderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              infoTextAlign: TextAlign.start,
                            ),
                            contentTitle: getAllCountriesText(region),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text('Countries',
                                        style: mediumTextStyle.copyWith(
                                            color: manatee))),
                                Expanded(
                                    flex: 2,
                                    child: Text(getCountriesText(region),
                                        style: mediumTextStyle,
                                        textAlign: TextAlign.right)),
                              ],
                            ),
                          ),
                          halfSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Payment providers',
                                  style:
                                      mediumTextStyle.copyWith(color: manatee)),
                              Text(getPaymentProviders(region),
                                  style: mediumTextStyle),
                            ],
                          ),
                          halfSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Fulfillment providers',
                                  style:
                                      mediumTextStyle.copyWith(color: manatee)),
                              Text(getFulfilmentProviders(region),
                                  style: mediumTextStyle),
                            ],
                          ),
                          halfSpace,
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                              color: Theme.of(context).cardColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Options',
                                  style: Theme.of(context).textTheme.bodyLarge),
                              halfSpace,
                              Text(
                                  'Enter specifics about available regional shipment methods.',
                                  style:
                                      mediumTextStyle.copyWith(color: manatee)),
                              space,
                              ShippingOptionsList(region),
                              Center(
                                child: TextButton(
                                  onPressed: () => context
                                      .pushRoute(AddUpdateShippingOptionRoute(
                                    addUpdateShippingOptionReq:
                                        AddUpdateShippingOptionReq(
                                            region: region),
                                  )),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Platform.isIOS
                                          ? const Icon(CupertinoIcons.add)
                                          : const Icon(Icons.add),
                                      const Text('Add Option'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                              color: Theme.of(context).cardColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Return Shipping Options',
                                  style: Theme.of(context).textTheme.bodyLarge),
                              halfSpace,
                              Text(
                                  'Enter specifics about available regional shipment methods.',
                                  style:
                                      mediumTextStyle.copyWith(color: manatee)),
                              space,
                              ShippingOptionsList(region, isReturn: true),
                              Center(
                                child: TextButton(
                                  onPressed: () => context
                                      .pushRoute(AddUpdateShippingOptionRoute(
                                    addUpdateShippingOptionReq:
                                        AddUpdateShippingOptionReq(
                                      region: region,
                                      returnShippingOption: true,
                                    ),
                                  )),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Platform.isIOS
                                          ? const Icon(CupertinoIcons.add)
                                          : const Icon(Icons.add),
                                      const Text('Add Option'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).padding.bottom)
                  ],
                );
              },
              loading: (_) => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              error: (_) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error loading region', style: largeTextStyle),
                    TextButton(
                        onPressed: () => regionCrudBloc
                            .add(RegionCrudEvent.load(widget.regionId)),
                        child: const Text('Retry'))
                  ],
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }

  String getCountriesText(Region region) {
    if (region.countries == null || region.countries!.isEmpty) {
      return 'No countries configured';
    }
    if (region.countries!.length > 4) {
      String result = '';
      region.countries!.take(4).forEach((element) {
        if (result.isEmpty) {
          result = element.name ?? '';
        } else {
          result = '$result, ${element.name ?? ''}';
        }
      });
      result = '$result +${region.countries!.length - 4}';
      return result;
    } else {
      String result = '';
      for (var element in region.countries!) {
        if (result.isEmpty) {
          result = element.name ?? '';
        } else {
          result = '$result, ${element.name ?? ''}';
        }
      }
      return result;
    }
  }

  String getAllCountriesText(Region region) {
    if (region.countries == null || region.countries!.isEmpty) {
      return 'No countries configured';
    }

    String result = '';
    for (var element in region.countries!) {
      if (result.isEmpty) {
        result = element.name ?? '';
      } else {
        result = '$result, ${element.name ?? ''}';
      }
    }
    return result;
  }

  String getPaymentProviders(Region region) {
    String paymentProviders = '';
    if (region.paymentProviders != null) {
      for (PaymentProvider payment in region.paymentProviders!) {
        if (paymentProviders.isNotEmpty) {
          paymentProviders = '$paymentProviders, ${payment.id!}';
        } else {
          paymentProviders = payment.id!;
        }
      }
    }
    return paymentProviders.capitalize;
  }

  String getFulfilmentProviders(Region region) {
    String fulfilmentProviders = '';
    if (region.fulfillmentProviders != null) {
      for (FulfillmentProvider fulfillment in region.fulfillmentProviders!) {
        if (fulfilmentProviders.isNotEmpty) {
          fulfilmentProviders = '$fulfilmentProviders, ${fulfillment.id!}';
        } else {
          fulfilmentProviders = fulfillment.id!;
        }
      }
    }
    return fulfilmentProviders.capitalize;
  }
}
