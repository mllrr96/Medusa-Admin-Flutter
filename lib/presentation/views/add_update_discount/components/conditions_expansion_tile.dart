import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/data/models/discount_condition_req.dart';
import 'package:medusa_admin/presentation/views/discount_conditions/components/condition_card.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'dart:io';
import 'package:medusa_admin/data/models/discount_condition_res.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class ConditionExpansionTile extends StatefulWidget {
  const ConditionExpansionTile({super.key, required this.onSaved});
  final void Function(List<DiscountCondition> conditions) onSaved;

  @override
  State<ConditionExpansionTile> createState() => _ConditionExpansionTileState();
}

class _ConditionExpansionTileState extends State<ConditionExpansionTile> {
  List<DiscountCondition> discountConditions = [];

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);

    return FormField(
      onSaved: (_) {
        widget.onSaved(discountConditions);
      },
      builder: (_) => FlexExpansionTile(
        maintainState: true,
        onExpansionChanged: (expanded) async {
          if (expanded && widget.key is GlobalKey) {
            await (widget.key as GlobalKey).currentContext.ensureVisibility();
          }
        },
        title: Text('Conditions', style: context.bodyLarge),
        childPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Column(
          children: <Widget>[
            if (discountConditions.isEmpty)
              Text(
                'Discount code apply to all products if left untouched.',
                style: smallTextStyle?.copyWith(color: manatee),
              ),
            if (discountConditions.isEmpty) space,
            if (discountConditions.isNotEmpty)
              ListView.separated(
                  separatorBuilder: (_, __) => space,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: discountConditions.length,
                  itemBuilder: (context, index) {
                    final condition = discountConditions[index];
                    return DetailedConditionCard(
                      discountCondition: condition,
                      onDeleteTap: () async {
                        setState(() => discountConditions.remove(condition));
                      },
                    );
                  }),
            if (discountConditions.length < 5)
              TextButton.icon(
                onPressed: () async {
                  final result = await context.pushRoute(
                      DiscountConditionsRoute(
                          discountConditionReq: DiscountConditionReq(
                              discountTypes: discountConditions
                                  .map((e) => e.type!)
                                  .toList())));
                  if (result is DiscountConditionRes) {
                    discountConditions.add(DiscountCondition(
                      type: result.conditionType,
                      operator: result.operator,
                      products: result.products,
                      productTags: result.productTags,
                      productCollections: result.productCollections,
                      productTypes: result.productTypes,
                      discountRuleId: null,
                    ));
                    (widget.key as GlobalKey?)
                        ?.currentContext
                        .ensureVisibility();
                    widget.onSaved(discountConditions);
                  }
                },
                label: const Text('Add Condition'),
                icon: Platform.isAndroid
                    ? const Icon(Icons.add)
                    : const Icon(CupertinoIcons.add),
              ),
          ],
        ),
      ),
    );
  }
}
