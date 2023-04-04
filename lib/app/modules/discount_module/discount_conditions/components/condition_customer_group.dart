import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import '../../../../data/models/store/customer_group.dart';
import '../../../../data/models/store/discount_condition.dart';
import '../../../components/adaptive_back_button.dart';
import '../../../components/adaptive_button.dart';
import '../controllers/discount_conditions_controller.dart';
import 'condition_customer_group_list_tile.dart';
import 'condition_operator_card.dart';

class ConditionCustomerGroupView extends StatelessWidget {
  const ConditionCustomerGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    return GetBuilder<ConditionCustomerGroupController>(
      init: ConditionCustomerGroupController(groupRepo: CustomerGroupRepo()),
      builder: (controller) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: const AdaptiveBackButton(),
                title: const Text('Choose groups'),
                actions: [
                  AdaptiveButton(
                      onPressed: controller.selectedCustomerGroups.isNotEmpty
                          ? () {
                              final res = DiscountConditionRes(
                                  operator: controller.discountConditionOperator,
                                  customerGroups: controller.selectedCustomerGroups,
                                  conditionType: DiscountConditionType.customerGroups);
                              Get.back(result: res);
                            }
                          : null,
                      child: const Text('Save')),
                ],
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Container(
                      alignment: Alignment.center,
                      height: kToolbarHeight,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: const CupertinoSearchTextField(),
                    )),
              ),
              if (!controller.updateMode)
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Column(
                    children: [
                      ConditionOperatorCard(
                        conditionOperator: DiscountConditionOperator.inn,
                        groupValue: controller.discountConditionOperator,
                        onTap: (val) {
                          controller.discountConditionOperator = val;
                          controller.update();
                        },
                      ),
                      space,
                      ConditionOperatorCard(
                        conditionOperator: DiscountConditionOperator.notIn,
                        groupValue: controller.discountConditionOperator,
                        onTap: (val) {
                          controller.discountConditionOperator = val;
                          controller.update();
                        },
                      ),
                    ],
                  ),
                )),
              SliverSafeArea(
                top: false,
                sliver: PagedSliverList.separated(
                  separatorBuilder: (_, __) => const Divider(height: 0, indent: 16),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<CustomerGroup>(
                    itemBuilder: (context, customerGroup, index) => ConditionCustomerGroupListTile(
                        customerGroup: customerGroup,
                        value: controller.selectedCustomerGroups.map((e) => e.id!).toList().contains(customerGroup.id),
                        enabled: !controller.disabledGroups.map((e) => e.id!).toList().contains(customerGroup.id),
                        onChanged: (val) {
                          if (val == null) return;
                          if (val) {
                            controller.selectedCustomerGroups.add(customerGroup);
                          } else {
                            controller.selectedCustomerGroups.removeWhere((e) => e.id == customerGroup.id);
                          }
                          controller.update();
                        }),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(child: CircularProgressIndicator.adaptive()),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ConditionCustomerGroupController extends GetxController {
  ConditionCustomerGroupController({required this.groupRepo});
  final CustomerGroupRepo groupRepo;
  List<CustomerGroup> selectedCustomerGroups = <CustomerGroup>[];
  DiscountConditionOperator discountConditionOperator = DiscountConditionOperator.inn;
  final PagingController<int, CustomerGroup> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final List<CustomerGroup> disabledGroups = Get.arguments ?? [];
  bool get updateMode => disabledGroups.isNotEmpty;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await groupRepo.retrieveCustomerGroups(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );

    result.when((success) {
      final isLastPage = success.customerGroups!.length < _pageSize;
      update([5]);
      if (isLastPage) {
        pagingController.appendLastPage(success.customerGroups!);
      } else {
        final nextPageKey = pageKey + success.customerGroups!.length;
        pagingController.appendPage(success.customerGroups!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
    });
  }
}
