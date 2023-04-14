import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import '../components/index.dart';
import '../controllers/discount_details_controller.dart';

class DiscountDetailsView extends GetView<DiscountDetailsController> {
  const DiscountDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const space = SizedBox(height: 12.0);

    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Discount Details'),
      ),
      floatingActionButton: const DiscountDetailsFab(),
      body: SafeArea(
        child: controller.obx(
          (discount) => ListView(
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, kToolbarHeight * 2),
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
                AdaptiveButton(onPressed: () async => await controller.loadDiscount(), child: const Text('Retry')),
              ],
            ),
          ),
          onLoading: const Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}
