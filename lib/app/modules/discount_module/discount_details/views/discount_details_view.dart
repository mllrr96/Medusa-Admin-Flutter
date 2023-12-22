import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../data/repository/discount/discount_repo.dart';
import '../../../../data/repository/discount_condition/discount_condition_repo.dart';
import '../components/index.dart';
import '../controllers/discount_details_controller.dart';

@RoutePage()
class DiscountDetailsView extends StatelessWidget {
  const DiscountDetailsView(this.discountId, {super.key});
  final String discountId;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    return GetBuilder<DiscountDetailsController>(
        init: DiscountDetailsController(
          discountRepo: DiscountRepo(),
          discountConditionRepo: DiscountConditionRepo(),
          discountId: discountId,
        ),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
              title: const Text('Discount Details'),
            ),
            floatingActionButton: const DiscountDetailsFab(),
            body: SafeArea(
              child: controller.obx(
                (discount) => ListView(
                  padding: const EdgeInsets.fromLTRB(
                      12.0, 8.0, 12.0, kToolbarHeight * 2),
                  children: [
                    DiscountDetailsCard(discount!),
                    space,
                    ConfigurationsCard(discount),
                    space,
                    ConditionsCard(discount),
                  ],
                ),
                onError: (e) => SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error loading discount \n ${e ?? ''}',
                        style: mediumTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12.0),
                      FilledButton(
                          onPressed: () async =>
                              await controller.loadDiscount(),
                          child: const Text('Retry')),
                    ],
                  ),
                ),
                onLoading:
                    const Center(child: CircularProgressIndicator.adaptive()),
              ),
            ),
          );
        });
  }
}
