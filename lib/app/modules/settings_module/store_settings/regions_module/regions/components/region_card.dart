import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';


class RegionCard extends StatelessWidget {
  const RegionCard(
      {super.key, required this.region, this.onTap, this.showProviders = true});
  final Region region;
  final void Function()? onTap;
  final bool showProviders;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    return InkWell(
      onTap: onTap ??
          () => context.pushRoute(RegionDetailsRoute(regionId: region.id!)),
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(region.name!, overflow: TextOverflow.ellipsis),
                const SizedBox(width: 8.0),
                Expanded(
                    child: Text(getCountries(),
                        style: mediumTextStyle!.copyWith(color: lightWhite),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2)),
              ],
            ),
            if (showProviders) const SizedBox(height: 6.0),
            if (showProviders)
              Row(
                children: [
                  Text('Payment Providers: ',
                      style: smallTextStyle?.copyWith(color: lightWhite)),
                  Expanded(
                      child: Text(getPaymentProviders(),
                          style: smallTextStyle?.copyWith(color: lightWhite))),
                ],
              ),
            if (showProviders)
              Row(
                children: [
                  Text('Fulfillment Providers: ',
                      style: smallTextStyle?.copyWith(color: lightWhite)),
                  Expanded(
                      child: Text(getFulfilmentProviders(),
                          style: smallTextStyle?.copyWith(color: lightWhite))),
                ],
              ),
          ],
        ),
      ),
    );
  }

  String getCountries() {
    String countries = '';
    if (region.countries != null) {
      for (Country country in region.countries!) {
        if (countries.isNotEmpty) {
          countries = '$countries, ${country.displayName!}';
        } else {
          countries = country.displayName!;
        }
      }
    }
    if (countries.isEmpty) {
      return 'No countries configured';
    }
    return '($countries)';
  }

  String getPaymentProviders() {
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

  String getFulfilmentProviders() {
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
}
