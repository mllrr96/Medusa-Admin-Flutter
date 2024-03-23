import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

import 'package:medusa_admin/core/extension/medusa_model_extension.dart';
import 'package:medusa_admin/presentation/widgets/date_time_card.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/color_extension.dart';


class ConfigurationsCard extends StatelessWidget {
  const ConfigurationsCard(this.discount, {super.key});
  final Discount discount;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    const halfSpace = Gap(6);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: context.getAlphaBlend(context.theme.cardColor),
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
              validator: (date){
                if(date == null){
                  return 'Please select a date';
                }
                return null;
              },
              dateTime: discount.startsAt,
              dateText: 'Start',
              dateTimeTextStyle: mediumTextStyle,
              dateTextStyle: mediumTextStyle?.copyWith(color: manatee),
              borderColor: Colors.transparent,
            ),
          space,
          if (discount.endsAt != null)
            DateTimeCard(
              validator: (date){
                if(date == null){
                  return 'Please select a date';
                }
                return null;
              },
              dateTime: discount.endsAt,
              dateText: 'Expiry',
              dateTimeTextStyle: mediumTextStyle?.copyWith(color: discount.isExpired ? Colors.redAccent : null),
              dateTextStyle: mediumTextStyle?.copyWith(color: manatee),
              borderColor: Colors.transparent,
            ),
          if (discount.endsAt != null) space,
        ],
      ),
    );
  }
}
