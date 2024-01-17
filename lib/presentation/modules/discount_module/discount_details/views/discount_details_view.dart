import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/domain/use_case/discount_details_use_case.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../components/index.dart';
import '../controllers/discount_details_controller.dart';

@RoutePage()
class DiscountDetailsView extends StatelessWidget {
  const DiscountDetailsView(this.discount, {super.key});
  final Discount discount;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    return GetBuilder<DiscountDetailsController>(
        init: DiscountDetailsController(
          discountDetailsUseCase: DiscountDetailsUseCase.instance,
          discountId: discount.id!,
        ),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: context.defaultSystemUiOverlayStyle,
              title: const Text('Discount Details'),
            ),
            floatingActionButton: const DiscountDetailsFab(),
            body: SafeArea(
              child: controller.obx(
                (discount) => SmartRefresher(
                  controller: controller.refreshController,
                  onRefresh: () async => await controller.loadDiscount(),
                  child: ListView(
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
                      const Gap(12.0),
                      FilledButton(
                          onPressed: () async =>
                              await controller.loadDiscount(),
                          child: const Text('Retry')),
                    ],
                  ),
                ),
                onLoading: DiscountLoadingPage(discount),
              ),
            ),
          );
        });
  }
}
