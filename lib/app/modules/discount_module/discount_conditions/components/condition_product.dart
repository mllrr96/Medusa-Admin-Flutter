import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/discount_module/discount_conditions/components/condition_product_list_tile.dart';

import '../controllers/discount_conditions_controller.dart';
import 'condition_operator_card.dart';

class ConditionProductView extends StatelessWidget {
  const ConditionProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    return GetBuilder<ConditionProductController>(
      init: ConditionProductController(productsRepo: ProductsRepo()),
      builder: (controller) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: const AdaptiveBackButton(),
                title: const Text('Choose products'),
                actions: [
                  AdaptiveButton(
                      onPressed: controller.selectedProducts.isNotEmpty
                          ? () {
                              final res = DiscountConditionRes(
                                  operator: controller.discountConditionOperator,
                                  products: controller.selectedProducts,
                                  conditionType: DiscountConditionType.products);
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
                  builderDelegate: PagedChildBuilderDelegate<Product>(
                    itemBuilder: (context, product, index) => ConditionProductListTile(
                        enabled: !controller.disabledProducts.map((e) => e.id!).toList().contains(product.id),
                        product: product,
                        value: controller.selectedProducts.map((e) => e.id!).toList().contains(product.id),
                        onChanged: (val) {
                          if (val == null) return;
                          if (val) {
                            controller.selectedProducts.add(product);
                          } else {
                            controller.selectedProducts.removeWhere((e) => e.id == product.id);
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

class ConditionProductController extends GetxController {
  ConditionProductController({required this.productsRepo});

  final ProductsRepo productsRepo;
  DiscountConditionOperator discountConditionOperator = DiscountConditionOperator.inn;
  final PagingController<int, Product> pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  List<Product> selectedProducts = <Product>[];
  final List<Product> disabledProducts = Get.arguments ?? [];
  bool get updateMode => disabledProducts.isNotEmpty;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await productsRepo.retrieveAll(
      queryParams: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        'is_giftcard': 'false',
      },
    );

    result.when((success) {
      final isLastPage = success.products!.length < _pageSize;
      update([5]);
      if (isLastPage) {
        pagingController.appendLastPage(success.products!);
      } else {
        final nextPageKey = pageKey + success.products!.length;
        pagingController.appendPage(success.products!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
    });
  }
}
