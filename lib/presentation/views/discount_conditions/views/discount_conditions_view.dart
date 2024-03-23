import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/data/models/discount_condition_req.dart';
import 'package:medusa_admin/data/models/discount_condition_res.dart';
import '../components/index.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

@RoutePage()
class DiscountConditionsView extends StatelessWidget {
  const DiscountConditionsView(this.discountConditionReq, {super.key});
  final DiscountConditionReq? discountConditionReq;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    final disabledConditions = discountConditionReq?.discountTypes ?? [];
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text('Discount Conditions'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          children: [
            if (disabledConditions
                .where((element) => element == DiscountConditionType.products)
                .isEmpty)
              Column(
                children: [
                  ConditionCard(
                    title: 'Product',
                    subtitle: 'Only for specific products',
                    onTap: () async => await context
                        .pushRoute(
                            ConditionProductRoute(disabledProducts: null))
                        .then((result) {
                      if (result is DiscountConditionRes) {
                        context.popRoute(result);
                      }
                    }),
                  ),
                  space,
                ],
              ),
            if (disabledConditions
                .where((element) =>
                    element == DiscountConditionType.customerGroups)
                .isEmpty)
              Column(
                children: [
                  ConditionCard(
                    title: 'Customer group',
                    subtitle: 'Only for specific customer group',
                    onTap: () async => await context
                        .pushRoute(
                            ConditionCustomerGroupRoute(disabledGroups: null))
                        .then((result) {
                      if (result is DiscountConditionRes) {
                        context.popRoute(result);
                      }
                    }),
                  ),
                  space,
                ],
              ),
            if (disabledConditions
                .where(
                    (element) => element == DiscountConditionType.productTags)
                .isEmpty)
              Column(
                children: [
                  ConditionCard(
                    title: 'Tag',
                    subtitle: 'Only for specific tags',
                    onTap: () async => await context
                        .pushRoute(ConditionTagRoute(disabledTags: null))
                        .then((result) {
                      if (result is DiscountConditionRes) {
                        context.popRoute(result);
                      }
                    }),
                  ),
                  space,
                ],
              ),
            if (disabledConditions
                .where((element) =>
                    element == DiscountConditionType.productCollections)
                .isEmpty)
              Column(
                children: [
                  ConditionCard(
                    title: 'Collection',
                    subtitle: 'Only for specific product collections',
                    onTap: () async => await context
                        .pushRoute(
                            ConditionCollectionRoute(disabledCollections: null))
                        .then((result) {
                      if (result is DiscountConditionRes) {
                        context.popRoute(result);
                      }
                    }),
                  ),
                  space,
                ],
              ),
            if (disabledConditions
                .where(
                    (element) => element == DiscountConditionType.productType)
                .isEmpty)
              ConditionCard(
                title: 'Type',
                subtitle: 'Only for specific product types',
                onTap: () async => await context
                    .pushRoute(ConditionTypeRoute(disabledTypes: null))
                    .then((result) {
                  if (result is DiscountConditionRes) {
                    context.popRoute(result);
                  }
                }),
              ),
          ],
        ),
      ),
    );
  }
}
