import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product_type/product_type_repo.dart';
import 'package:medusa_admin/app/modules/discount_module/discount_conditions/components/condition_type_list_tile.dart';
import '../../../components/adaptive_back_button.dart';
import '../../../components/adaptive_button.dart';
import '../controllers/discount_conditions_controller.dart';
import 'condition_operator_card.dart';

class ConditionTypeView extends StatelessWidget {
  const ConditionTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    return GetBuilder<ConditionTypeController>(
      init: ConditionTypeController(typeRepo: ProductTypeRepo()),
      builder: (controller) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: const AdaptiveBackButton(),
                title: const Text('Choose types'),
                actions: [
                  AdaptiveButton(
                      onPressed: controller.selectedTypes.isNotEmpty
                          ? () {
                              final res = DiscountConditionRes(
                                  operator: controller.discountConditionOperator,
                                  productTypes: controller.selectedTypes,
                                  conditionType: DiscountConditionType.productType);
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
              if(!controller.updateMode)
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
                  builderDelegate: PagedChildBuilderDelegate<ProductType>(
                    itemBuilder: (context, type, index) => ConditionTypeListTile(
                        type: type,
                        value: controller.selectedTypes.map((e) => e.id!).toList().contains(type.id),
                        enabled: !controller.disabledTypes.map((e) => e.id!).toList().contains(type.id),
                        onChanged: (val) {
                          if (val == null) return;
                          if (val) {
                            controller.selectedTypes.add(type);
                          } else {
                            controller.selectedTypes.removeWhere((e) => e.id == type.id);
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

class ConditionTypeController extends GetxController {
  ConditionTypeController({required this.typeRepo});
  final ProductTypeRepo typeRepo;
  List<ProductType> selectedTypes = <ProductType>[];
  DiscountConditionOperator discountConditionOperator = DiscountConditionOperator.inn;
  final PagingController<int, ProductType> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final List<ProductType> disabledTypes = Get.arguments ?? [];
  bool get updateMode => disabledTypes.isNotEmpty;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await typeRepo.retrieveProductTypes(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );

    result.when((success) {
      final isLastPage = success.productTypes!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.productTypes!);
      } else {
        final nextPageKey = pageKey + success.productTypes!.length;
        pagingController.appendPage(success.productTypes!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
    });
  }
}
