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

  // Helper function to determine if a shipping option is for return or shipping
  bool _isReturnShippingOption(ShippingOption shippingOption) {
    if (shippingOption.rules == null || shippingOption.rules!.isEmpty) {
      return false;
    }

    // Look for the "is_return" rule
    for (final rule in shippingOption.rules!) {
      if (rule.attribute == 'is_return' && rule.operator == 'eq' && rule.value == 'true') {
        return true;
      }
    }
    return false;
  }

  // Helper function to check if shipping option is enabled in store
  bool _isEnabledInStore(ShippingOption shippingOption) {
    if (shippingOption.rules == null || shippingOption.rules!.isEmpty) {
      return false;
    }

    // Look for the "enabled_in_store" rule
    for (final rule in shippingOption.rules!) {
      if (rule.attribute == 'enabled_in_store' && rule.operator == 'eq' && rule.value == 'true') {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry getBorderRadius(int index, int length) {
      if (length == 1) {
        return BorderRadius.circular(8);
      } else if (index == 0) {
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

    List<ShippingOption> getShippingOptions(List<ShippingOption>? shippingOptions) {
      if (shippingOptions == null || shippingOptions.isEmpty) {
        return [];
      }

      return shippingOptions.where((option) {
        // final isEnabled = _isEnabledInStore(option);
        final isReturn = _isReturnShippingOption(option);
        return !isReturn;
      }).toList();
    }

    List<ShippingOption> getReturnOptions(List<ShippingOption>? shippingOptions) {
      if (shippingOptions == null || shippingOptions.isEmpty) {
        return [];
      }

      return shippingOptions.where((option) {
        // final isEnabled = _isEnabledInStore(option);
        final isReturn = _isReturnShippingOption(option);
        return isReturn;
      }).toList();
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

    Widget buildShippingOptionTile(ShippingOption option, int index, int total) {
      final isEnabled = _isEnabledInStore(option);
      return ListTile(
        tileColor: context.theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: getBorderRadius(index, total),
        ),
        title: Text(option.name ?? ''),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: context.theme.disabledColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: isEnabled ? context.theme.disabledColor : context.theme.primaryColor,
            ),
          ),
          child: Text(
            isEnabled ? 'Store' : 'Admin',
            style: context.bodySmall?.copyWith(
              color: isEnabled ? context.theme.disabledColor : context.theme.primaryColor,
            ),
          ),
        ),
      );
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
              Builder(
                builder: (context) {
                  final shippingOptions = getShippingOptions(serviceZone.shippingOptions);
                  if (shippingOptions.isNotEmpty) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: shippingOptions.length,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      itemBuilder: (context, index) {
                        final e = shippingOptions[index];
                        return buildShippingOptionTile(e, index, shippingOptions.length);
                      },
                    );
                  } else {
                    return ListTile(
                      tileColor: context.theme.scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      title: Text(
                        'No shipping options available',
                        style: context.bodyMedium?.copyWith(color: context.theme.disabledColor),
                      ),
                    );
                  }
                },
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
              Builder(
                builder: (context) {
                  final returnOptions = getReturnOptions(serviceZone.shippingOptions);
                  if (returnOptions.isNotEmpty) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: returnOptions.length,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      itemBuilder: (context, index) {
                        final e = returnOptions[index];
                        return buildShippingOptionTile(e, index, returnOptions.length);
                      },
                    );
                  } else {
                    return ListTile(
                      tileColor: context.theme.scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      title: Text(
                        'No return options available',
                        style: context.bodyMedium?.copyWith(color: context.theme.disabledColor),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
