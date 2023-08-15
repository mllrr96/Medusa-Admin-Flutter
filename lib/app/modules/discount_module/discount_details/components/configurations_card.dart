import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';

import '../../../components/date_time_card.dart';

class ConfigurationsCard extends StatelessWidget {
  const ConfigurationsCard(this.discount, {Key? key}) : super(key: key);
  final Discount discount;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);
    final expired = discount.endsAt != null && discount.endsAt!.isBefore(DateTime.now());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: Theme.of(context).expansionTileTheme.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Configurations'),
          ),
          halfSpace,
          if (discount.startsAt != null)
            DateTimeCard(
              dateTime: discount.startsAt,
              dateText: 'Start',
              dateTimeTextStyle: mediumTextStyle,
              dateTextStyle: mediumTextStyle?.copyWith(color: lightWhite),
              borderColor: Colors.transparent,
            ),
          space,
          if (discount.endsAt != null)
            DateTimeCard(
              dateTime: discount.endsAt,
              dateText: 'Expiry',
              dateTimeTextStyle: mediumTextStyle?.copyWith(color: expired ? Colors.redAccent : null),
              dateTextStyle: mediumTextStyle?.copyWith(color: lightWhite),
              borderColor: Colors.transparent,
            ),
          if (discount.endsAt != null) space,
        ],
      ),
    );
  }
}
