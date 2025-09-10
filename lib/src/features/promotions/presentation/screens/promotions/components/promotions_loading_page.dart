import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/features/promotions/presentation/screens/promotions/components/promotion_card.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PromotionsLoadingPage extends StatelessWidget {
  const PromotionsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final discount = Promotion(code: 'MEDUSA', id: '');
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
          12,
          (index) => index.isEven ? PromotionCard(discount) : const Gap(12.0),
        ),
      ),
    );
  }
}
