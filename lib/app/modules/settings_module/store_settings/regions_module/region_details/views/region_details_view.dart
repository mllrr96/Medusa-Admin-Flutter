import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:info_popup/info_popup.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/domain/use_case/region_details_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../add_update_shipping_option/controllers/add_update_shipping_option_controller.dart';
import '../components/index.dart';
import '../controllers/region_details_controller.dart';

@RoutePage()
class RegionDetailsView extends StatelessWidget {
  const RegionDetailsView(this.regionId, {super.key});
  final String regionId;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    const halfSpace = Gap(6);
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
      return paymentProviders.capitalize ?? paymentProviders;
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
      return fulfilmentProviders.capitalize ?? fulfilmentProviders;
    }

    return GetBuilder<RegionDetailsController>(
        init: RegionDetailsController(
          regionDetailsUseCase: RegionDetailsUseCase.instance,
          regionId: regionId,
        ),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Obx(() {
                return Text(controller.regionName.value);
              }),
              actions: [
                IconButton(
                    icon: const Icon(Icons.more_horiz_outlined),
                    onPressed: () async {
                      await showModalActionSheet<int>(
                          title: 'Manage ${controller.regionName.value} region',
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
                            if (controller.state == null) {
                              return;
                            }
                            context.pushRoute(
                                AddRegionRoute(region: controller.state!));
                            break;
                          case 1:
                            if (controller.state == null) {
                              return;
                            }
                            await showTextAnswerDialog(
                              keyword: controller.state!.name!,
                              hintText: controller.state!.name!,
                              context: context,
                              title: 'Delete region?',
                              message:
                                  'Are you sure you want to delete this region?\n Type the name "${controller.state!.name!}" to confirm ',
                              okLabel: 'Yes, confirm',
                              retryTitle: 'Wrong name',
                              retryMessage:
                                  'Make sure to type the region name "${controller.state!.name!}" to confirm deletion',
                              isDestructiveAction: true,
                            ).then((value) async {
                              if (value) {
                                await controller.deleteRegion(context);
                              }
                            });
                            break;
                        }
                      });
                    })
              ],
            ),
            body: SafeArea(
                child: controller.obx(
              (region) => ListView(
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
                                    .copyWith(color: lightWhite)),
                            Text(
                                '${region?.currencyCode?.toUpperCase() ?? '-'} ${NumberFormat.simpleCurrency(name: region?.currencyCode?.toUpperCase()).currencySymbol}',
                                style: mediumTextStyle),
                          ],
                        ),
                        halfSpace,
                        InfoPopupWidget(
                          arrowTheme: InfoPopupArrowTheme(
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
                          contentTitle: getAllCountriesText(region!),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  child: Text('Countries',
                                      style: mediumTextStyle.copyWith(
                                          color: lightWhite))),
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
                                style: mediumTextStyle.copyWith(
                                    color: lightWhite)),
                            Text(getPaymentProviders(region),
                                style: mediumTextStyle),
                          ],
                        ),
                        halfSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Fulfillment providers',
                                style: mediumTextStyle.copyWith(
                                    color: lightWhite)),
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
                                style: mediumTextStyle.copyWith(
                                    color: lightWhite)),
                            space,
                            // AnimatedSwitcher(
                            //   duration: const Duration(milliseconds: 300),
                            //   child: controller.shippingOptions == null
                            //       ? const Center(child: CircularProgressIndicator.adaptive())
                            //       : ListView.separated(
                            //           separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                            //           shrinkWrap: true,
                            //           physics: const NeverScrollableScrollPhysics(),
                            //           itemCount: controller.shippingOptions!.length,
                            //           itemBuilder: (context, index) => ShippingOptionCard(
                            //             shippingOption: controller.shippingOptions![index],
                            //             onDeleteTap: () async =>
                            //                 await controller.deleteShippingOption(controller.shippingOptions![index].id!),
                            //             onEditTap: () => Get.toNamed(
                            //               Routes.ADD_UPDATE_SHIPPING_OPTION,
                            //               arguments: AddUpdateShippingOptionReq(
                            //                 region: region,
                            //                 shippingOption: controller.shippingOptions![index],
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            // ),
                            GetBuilder<RegionDetailsController>(
                                id: 0,
                                builder: (controller) {
                                  return FutureBuilder<List<ShippingOption>?>(
                                      future:
                                          controller.retrieveShippingOptions(),
                                      builder: (context, snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.none:
                                          case ConnectionState.waiting:
                                            return Skeletonizer(
                                              child: ShippingOptionCard(
                                                shippingOption: ShippingOption(
                                                    name: 'Shipping option',
                                                    regionId: '',
                                                    profileId: '',
                                                    providerId: '',
                                                    priceType:
                                                        ShippingOptionPriceType
                                                            .calculated,
                                                    amount: 1200,
                                                    region: const Region(
                                                        name: 'Test',
                                                        currencyCode: 'USD',
                                                        taxRate: 1000),
                                                    requirements: [
                                                      ShippingOptionRequirement(
                                                        type: RequirementType
                                                            .minSubtotal,
                                                        amount: 1200,
                                                        shippingOptionId: null,
                                                      ),
                                                      ShippingOptionRequirement(
                                                        type: RequirementType
                                                            .maxSubtotal,
                                                        amount: 2200,
                                                        shippingOptionId: null,
                                                      ),
                                                    ]),
                                              ),
                                            );
                                          case ConnectionState.active:
                                          case ConnectionState.done:
                                            if (snapshot.hasData) {
                                              return ListView.separated(
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 6.0),
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    snapshot.data!.length,
                                                itemBuilder: (context, index) =>
                                                    ShippingOptionCard(
                                                  shippingOption:
                                                      snapshot.data![index],
                                                  onDeleteTap: () async =>
                                                      await controller
                                                          .deleteShippingOption(
                                                              snapshot
                                                                  .data![index]
                                                                  .id!),
                                                  onEditTap: () =>
                                                      context.pushRoute(
                                                          AddUpdateShippingOptionRoute(
                                                    addUpdateShippingOptionReq:
                                                        AddUpdateShippingOptionReq(
                                                      region: region,
                                                      shippingOption:
                                                          snapshot.data![index],
                                                    ),
                                                  )),
                                                ),
                                              );
                                            } else {
                                              return const SizedBox.shrink();
                                            }
                                        }
                                      });
                                }),
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
                                style: mediumTextStyle.copyWith(
                                    color: lightWhite)),
                            space,
                            GetBuilder<RegionDetailsController>(
                                id: 1,
                                builder: (controller) {
                                  return FutureBuilder<List<ShippingOption>?>(
                                      future:
                                          controller.retrieveShippingOptions(
                                              isReturn: true),
                                      builder: (context, snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.none:
                                          case ConnectionState.waiting:
                                            return Skeletonizer(
                                              child: ShippingOptionCard(
                                                shippingOption: ShippingOption(
                                                    name: 'Shipping option',
                                                    regionId: '',
                                                    profileId: '',
                                                    providerId: '',
                                                    priceType:
                                                        ShippingOptionPriceType
                                                            .calculated,
                                                    amount: 1200,
                                                    region: const Region(
                                                        name: 'Test',
                                                        currencyCode: 'USD',
                                                        taxRate: 1000),
                                                    requirements: [
                                                      ShippingOptionRequirement(
                                                        type: RequirementType
                                                            .minSubtotal,
                                                        amount: 1200,
                                                        shippingOptionId: null,
                                                      ),
                                                      ShippingOptionRequirement(
                                                        type: RequirementType
                                                            .maxSubtotal,
                                                        amount: 2200,
                                                        shippingOptionId: null,
                                                      ),
                                                    ]),
                                              ),
                                            );
                                          case ConnectionState.active:
                                          case ConnectionState.done:
                                            if (snapshot.hasData) {
                                              return ListView.separated(
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 6.0),
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    snapshot.data!.length,
                                                itemBuilder: (context, index) =>
                                                    ShippingOptionCard(
                                                        shippingOption: snapshot
                                                            .data![index],
                                                        onDeleteTap: () async =>
                                                            await controller
                                                                .deleteShippingOption(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .id!,
                                                                    returnShippingOption:
                                                                        true),
                                                        onEditTap: () =>
                                                            context.pushRoute(
                                                                AddUpdateShippingOptionRoute(
                                                              addUpdateShippingOptionReq:
                                                                  AddUpdateShippingOptionReq(
                                                                region: region,
                                                                shippingOption:
                                                                    snapshot.data![
                                                                        index],
                                                              ),
                                                            ))),
                                              );
                                            } else {
                                              return const SizedBox.shrink();
                                            }
                                        }
                                      });
                                }),
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
              ),
              onLoading:
                  const Center(child: CircularProgressIndicator.adaptive()),
              onError: (e) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(e ?? 'Error loading users', style: largeTextStyle),
                    TextButton(
                        onPressed: () async => controller.loadRegion(),
                        child: const Text('Retry'))
                  ],
                ),
              ),
            )),
          );
        });
  }
}
