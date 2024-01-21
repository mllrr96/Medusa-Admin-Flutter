import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../add_update_shipping_option/controllers/add_update_shipping_option_controller.dart';
import '../controllers/region_details_controller.dart';
import 'shipping_option_card.dart';

class ReturnShippingOptionsList extends GetView<RegionDetailsController> {
  const ReturnShippingOptionsList(this.region, {super.key});
  final Region region;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ShippingOption>?>(
        future: controller.returnShippingOptionsFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Skeletonizer(
                child: ShippingOptionCard(
                  shippingOption: ShippingOption(
                      name: 'Shipping option',
                      regionId: '',
                      profileId: '',
                      providerId: '',
                      priceType: ShippingOptionPriceType.calculated,
                      amount: 1200,
                      region: const Region(
                          name: 'Test',
                          currencyCode: 'USD',
                          taxRate: 1000),
                      requirements: [
                        ShippingOptionRequirement(
                          type: RequirementType.minSubtotal,
                          amount: 1200,
                          shippingOptionId: null,
                        ),
                        ShippingOptionRequirement(
                          type: RequirementType.maxSubtotal,
                          amount: 2200,
                          shippingOptionId: null,
                        ),
                      ]),
                ),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (_, __) =>
                  const SizedBox(height: 6.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ShippingOptionCard(
                      shippingOption: snapshot.data![index],
                      onDeleteTap: () async => await controller
                          .deleteShippingOption(snapshot.data![index].id!,
                          returnShippingOption: true),
                      onEditTap: () =>
                          context.pushRoute(AddUpdateShippingOptionRoute(
                            addUpdateShippingOptionReq:
                            AddUpdateShippingOptionReq(
                              region: region,
                              shippingOption: snapshot.data![index],
                            ),
                          ))),
                );
              } else {
                return const SizedBox.shrink();
              }
          }
        });
  }
}
