import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/discount_module/discount_conditions/components/condition_collection_list_tile.dart';
import '../../../components/adaptive_back_button.dart';
import '../controllers/discount_conditions_controller.dart';
import 'condition_operator_card.dart';

class ConditionCollectionView extends StatelessWidget {
  const ConditionCollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    return GetBuilder<ConditionCollectionController>(
      init: ConditionCollectionController(collectionRepo: CollectionRepo()),
      builder: (controller) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: const AdaptiveBackButton(),
                title: const Text('Choose collections'),
                actions: [
                  AdaptiveButton(
                      onPressed: controller.selectedCollections.isNotEmpty
                          ? () {
                              final res = DiscountConditionRes(
                                  operator: controller.discountConditionOperator,
                                  productCollections: controller.selectedCollections,
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
                  builderDelegate: PagedChildBuilderDelegate<ProductCollection>(
                    itemBuilder: (context, collection, index) => ConditionCollectionListTile(
                      collection: collection,
                      value: controller.selectedCollections.map((e) => e.id!).toList().contains(collection.id),
                      enabled: !controller.disabledCollections.map((e) => e.id!).toList().contains(collection.id),
                      onChanged: (val) {
                        if (val == null) return;
                        if (val) {
                          controller.selectedCollections.add(collection);
                        } else {
                          controller.selectedCollections.removeWhere((e) => e.id == collection.id);
                        }
                        controller.update();
                      },
                    ),
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

class ConditionCollectionController extends GetxController {
  ConditionCollectionController({required this.collectionRepo});
  final CollectionRepo collectionRepo;
  List<ProductCollection> selectedCollections = <ProductCollection>[];
  DiscountConditionOperator discountConditionOperator = DiscountConditionOperator.inn;
  final PagingController<int, ProductCollection> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final List<ProductCollection> disabledCollections = Get.arguments ?? [];
  bool get updateMode => disabledCollections.isNotEmpty;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await collectionRepo.retrieveAll(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );

    result.when((success) {
      final isLastPage = success.collections!.length < _pageSize;
      update([5]);
      if (isLastPage) {
        pagingController.appendLastPage(success.collections!);
      } else {
        final nextPageKey = pageKey + success.collections!.length;
        pagingController.appendPage(success.collections!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
    });
  }
}
