import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/app/modules/discount_module/discount_conditions/components/condition_product_list_tile.dart';
import '../../discount_conditions/components/condition_collection_list_tile.dart';
import '../../discount_conditions/components/condition_customer_group_list_tile.dart';
import '../../discount_conditions/components/condition_tag_list_tile.dart';
import '../../discount_conditions/components/condition_type_list_tile.dart';
import '../controllers/update_condition_controller.dart';

class UpdateConditionView extends GetView<UpdateConditionController> {
  const UpdateConditionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomViewPadding = MediaQuery.of(context).viewPadding.bottom;

    return GetBuilder<UpdateConditionController>(
      builder: (controller) {
        final buttonText = AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            child: controller.selectedItems.isEmpty
                ? const Text('Delete condition', style: TextStyle(color: Colors.white), key: Key('delete'))
                : const Text('Update', style: TextStyle(color: Colors.white), key: Key('update')));
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveBackButton(),
            title: const Text('Update Condition'),
            actions: [
              AdaptiveButton(
                  onPressed: () async => await controller.add(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (Platform.isIOS) const Icon(CupertinoIcons.add),
                      if (Platform.isAndroid) const Icon(Icons.add),
                      const Text('Add'),
                    ],
                  )),
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: bottomViewPadding, left: 22.0, right: 22.0, top: bottomViewPadding / 2),
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: AdaptiveFilledButton(
              buttonWidth: Get.width / 3,
              buttonColor: controller.selectedItems.isEmpty ? Colors.redAccent : null,
              onPressed: () => controller.save(),
              child: buttonText,
            ),
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                switch (controller.updateConditionReq.discountConditionType) {
                  case DiscountConditionType.products:
                    final item = controller.items[index] as Product;
                    return ConditionProductListTile(
                      product: item,
                      value: (controller.selectedItems as List<Product>).map((e) => e.id!).toList().contains(item.id),
                      onChanged: (val) {
                        if (val == null) return;
                        if (val) {
                          (controller.selectedItems as List<Product>).add(item);
                        } else {
                          (controller.selectedItems as List<Product>).removeWhere((element) => element.id == item.id);
                        }
                        controller.update();
                      },
                    );
                  case DiscountConditionType.productType:
                    final item = controller.items[index] as ProductType;
                    return ConditionTypeListTile(
                      type: item,
                      value:
                          (controller.selectedItems as List<ProductType>).map((e) => e.id!).toList().contains(item.id),
                      onChanged: (val) {
                        if (val == null) return;
                        if (val) {
                          (controller.selectedItems as List<ProductType>).add(item);
                        } else {
                          (controller.selectedItems as List<ProductType>)
                              .removeWhere((element) => element.id == item.id);
                        }
                        controller.update();
                      },
                    );
                  case DiscountConditionType.productCollections:
                    final item = controller.items[index] as ProductCollection;
                    return ConditionCollectionListTile(
                      collection: item,
                      value: (controller.selectedItems as List<ProductCollection>)
                          .map((e) => e.id!)
                          .toList()
                          .contains(item.id),
                      onChanged: (val) {
                        if (val == null) return;
                        if (val) {
                          (controller.selectedItems as List<ProductCollection>).add(item);
                        } else {
                          (controller.selectedItems as List<ProductCollection>)
                              .removeWhere((element) => element.id == item.id);
                        }
                        controller.update();
                      },
                    );

                  case DiscountConditionType.productTags:
                    final item = controller.items[index] as ProductTag;
                    return ConditionTagListTile(
                      tag: item,
                      value:
                          (controller.selectedItems as List<ProductTag>).map((e) => e.id!).toList().contains(item.id),
                      onChanged: (val) {
                        if (val == null) return;
                        if (val) {
                          (controller.selectedItems as List<ProductTag>).add(item);
                        } else {
                          (controller.selectedItems as List<ProductTag>)
                              .removeWhere((element) => element.id == item.id);
                        }
                        controller.update();
                      },
                    );

                  case DiscountConditionType.customerGroups:
                    final item = controller.items[index] as CustomerGroup;
                    return ConditionCustomerGroupListTile(
                      customerGroup: item,
                      value: (controller.selectedItems as List<CustomerGroup>)
                          .map((e) => e.id!)
                          .toList()
                          .contains(item.id),
                      onChanged: (val) {
                        if (val == null) return;
                        if (val) {
                          (controller.selectedItems as List<CustomerGroup>).add(item);
                        } else {
                          (controller.selectedItems as List<CustomerGroup>)
                              .removeWhere((element) => element.id == item.id);
                        }
                        controller.update();
                      },
                    );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
