import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/models/store/discount_rule.dart';
import 'package:medusa_admin/app/modules/discount_module/discounts/components/discount_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DiscountsLoadingPage extends StatelessWidget {
  const DiscountsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const discount = Discount(
        code: 'MEDUSA',
        rule: DiscountRule(
          description: '10% off on all products',
          type: DiscountRuleType.fixed,
          value: 12000,
        ));
    return Column(
      children: List.generate(
          10,
          (index) =>
              index.isEven? const Skeletonizer(enabled: true, child: DiscountCard(discount)): const Gap(12.0),),
    );
  }
}
