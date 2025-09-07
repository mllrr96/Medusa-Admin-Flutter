import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/features/discounts/presentation/screens/discounts/components/discount_card.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DiscountsLoadingPage extends StatelessWidget {
  const DiscountsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final discount = Promotion(code: 'MEDUSA', id: '');
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
          12,
          (index) => index.isEven ? DiscountCard(discount) : const Gap(12.0),
        ),
      ),
    );
  }
}
