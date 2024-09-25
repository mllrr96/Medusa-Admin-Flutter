import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RegionCard extends StatelessWidget {
  const RegionCard(this.region,
      {super.key, this.onTap, this.showProviders = true});
  final Region region;
  final void Function()? onTap;
  final bool showProviders;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    return InkWell(
      onTap: onTap ??
          () => context.pushRoute(RegionDetailsRoute(regionId: region.id!)),
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      child: ShadCard(
        title: Text(region.name!, overflow: TextOverflow.ellipsis),
        footer: showProviders
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(6.0),
                  Row(
                    children: [
                      Text('Payment Providers: ',
                          style: smallTextStyle?.copyWith(color: manatee)),
                      Expanded(
                          child: Text(getPaymentProviders(),
                              style: smallTextStyle?.copyWith(color: manatee))),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Fulfillment Providers: ',
                          style: smallTextStyle?.copyWith(color: manatee)),
                      Expanded(
                          child: Text(getFulfilmentProviders(),
                              style: smallTextStyle?.copyWith(color: manatee))),
                    ],
                  ),
                ],
              )
            : null,
        child: Text(getCountries(),
            style: mediumTextStyle!.copyWith(color: manatee),
            overflow: TextOverflow.ellipsis,
            maxLines: 2),
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
    return paymentProviders.capitalize;
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
    return fulfilmentProviders.capitalize;
  }
}
