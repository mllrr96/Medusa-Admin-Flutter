import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'conditions_card.dart';
import 'configurations_card.dart';

class PromotionLoadingPage extends StatelessWidget {
  const PromotionLoadingPage(this.discount, {super.key});
  final Promotion discount;
  @override
  Widget build(BuildContext context) {
    const space = Gap(12);

    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0),
        child: Column(
          children: [
            // DiscountDetailsCard(discount),
            // space,
            ConfigurationsCard(discount),
            space,
            ConditionsCard(discount),
          ],
        ),
      ),
    );
  }
}
