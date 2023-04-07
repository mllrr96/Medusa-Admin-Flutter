import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import '../controllers/region_details_controller.dart';

class RegionDetailsView extends GetView<RegionDetailsController> {
  const RegionDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);
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

    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: Text('Europe', style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
        actions: [
          AdaptiveIcon(
              icon: const Icon(Icons.more_horiz_outlined),
              onPressed: () async {
                await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
                  const SheetAction(label: 'Edit', key: 0),
                  const SheetAction(label: 'Delete', isDestructiveAction: true, key: 1),
                ]).then((result) {
                  if (result == null) return;
                  if (result == 0) {
                  } else if (result == 1) {}
                });
              })
        ],
      ),
      body: SafeArea(
          child: controller.obx(
        (region) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)), color: Theme.of(context).cardColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Details', style: Theme.of(context).textTheme.bodyLarge),
                    halfSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Currency', style: mediumTextStyle!.copyWith(color: lightWhite)),
                        Text(region?.currencyCode?.capitalize ?? '-', style: mediumTextStyle),
                      ],
                    ),
                    halfSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text('Countries', style: mediumTextStyle.copyWith(color: lightWhite))),
                        Expanded(
                            child: Text(getCountriesText(region!), style: mediumTextStyle, textAlign: TextAlign.right)),
                      ],
                    ),
                    halfSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Payment providers', style: mediumTextStyle.copyWith(color: lightWhite)),
                        Text(getPaymentProviders(region), style: mediumTextStyle),
                      ],
                    ),
                    halfSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fulfillment providers', style: mediumTextStyle.copyWith(color: lightWhite)),
                        Text(getFulfilmentProviders(region), style: mediumTextStyle),
                      ],
                    ),
                    halfSpace,
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)), color: Theme.of(context).cardColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Shipping Options', style: Theme.of(context).textTheme.bodyLarge),
                    Text('Enter specifics about available regional shipment methods.',
                        style: mediumTextStyle.copyWith(color: lightWhite)),
                    halfSpace,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: const Color(0xFFF2F2F7), width: 3),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text('PostFake Standard', style: mediumTextStyle)),
                                  AdaptiveIcon(onPressed: () {}, icon: const Icon(Icons.more_horiz))
                                ],
                              ),
                              halfSpace,
                              Text('Flat Rate: 10.00 EUR - Min. subtotal: N/A - Max. subtotal: N/A',
                                  style: smallTextStyle!.copyWith(color: lightWhite)),
                              space,
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(child: AdaptiveButton(onPressed: () {}, child: const Text('Add Option')))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)), color: Theme.of(context).cardColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Return Shipping Options', style: Theme.of(context).textTheme.bodyLarge),
                    Text('Enter specifics about available regional shipment methods.',
                        style: mediumTextStyle.copyWith(color: lightWhite)),
                    halfSpace,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: const Color(0xFFF2F2F7), width: 3),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text('PostFake Standard', style: mediumTextStyle)),
                                  AdaptiveIcon(onPressed: () {}, icon: const Icon(Icons.more_horiz))
                                ],
                              ),
                              halfSpace,
                              Text('Flat Rate: 10.00 EUR - Min. subtotal: N/A - Max. subtotal: N/A',
                                  style: smallTextStyle.copyWith(color: lightWhite)),
                              space,
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(child: AdaptiveButton(onPressed: () {}, child: const Text('Add Option')))
                  ],
                ),
              ),
            ],
          ),
        ),
        onLoading: const Center(child: CircularProgressIndicator.adaptive()),
        onError: (e) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(e ?? 'Error loading users', style: largeTextStyle),
              AdaptiveButton(onPressed: () async => controller.loadRegion(), child: const Text('Retry'))
            ],
          ),
        ),
      )),
    );
  }
}
