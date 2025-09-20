import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/string_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class StockLocationShippingTile extends StatelessWidget {
  const StockLocationShippingTile(this.serviceZone, {super.key});

  final ServiceZone serviceZone;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry getBorderRadius(int index, int length) {
      if (index == 0) {
        return const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        );
      } else if (index == length - 1) {
        return const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        );
      } else {
        return BorderRadius.zero;
      }
    }

    String countriesNames() {
      if (serviceZone.geoZones == null || serviceZone.geoZones!.isEmpty) {
        return 'No countries';
      }
      final countryNames = serviceZone.geoZones!
          .map((geoZone) => geoZone.countryCode.getCountry.displayOnStore)
          .toList();
      return countryNames.isNotEmpty ? countryNames.join(', ') : 'No countries';
    }

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(LucideIcons.mapPinned)),
              Gap(10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceZone.name ?? '',
                      style: context.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      countriesNames(),
                      style: context.bodyMedium?.copyWith(color: context.theme.disabledColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping Options',
                style: context.bodyMedium,
              ),
              Gap(10),
              if (serviceZone.shippingOptions != null && serviceZone.shippingOptions!.isNotEmpty)
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: serviceZone.shippingOptions!.length,
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const Divider(height: 0),
                  itemBuilder: (context, index) {
                    final e = serviceZone.shippingOptions![index];
                    return ListTile(
                      tileColor: context.theme.scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: getBorderRadius(index, serviceZone.shippingOptions!.length),
                      ),
                      title: Text(e.name ?? ''),
                    );
                  },
                )
              else
                ListTile(
                  tileColor: context.theme.scaffoldBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title: Text(
                    'No shipping options available',
                    style: context.bodyMedium?.copyWith(color: context.theme.disabledColor),
                  ),
                ),
            ],
          ),
          Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Return Options',
                style: context.bodyMedium,
              ),
              Gap(10),
              if (serviceZone.shippingOptions != null && serviceZone.shippingOptions!.isNotEmpty)
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: serviceZone.shippingOptions!.length,
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const Divider(height: 0),
                  itemBuilder: (context, index) {
                    final e = serviceZone.shippingOptions![index];
                    return ListTile(
                      tileColor: context.theme.scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: getBorderRadius(index, serviceZone.shippingOptions!.length),
                      ),
                      title: Text(e.name ?? ''),
                    );
                  },
                )
              else
                ListTile(
                  tileColor: context.theme.scaffoldBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title: Text(
                    'No return options available',
                    style: context.bodyMedium?.copyWith(color: context.theme.disabledColor),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
