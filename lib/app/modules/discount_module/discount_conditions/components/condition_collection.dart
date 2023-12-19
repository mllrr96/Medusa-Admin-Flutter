import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/discount_module/discount_conditions/components/condition_collection_list_tile.dart';
import '../../../components/adaptive_back_button.dart';
import '../../../components/search_text_field.dart';
import '../controllers/discount_conditions_controller.dart';
import 'condition_operator_card.dart';
import 'package:medusa_admin/core/utils/enums.dart';

@RoutePage()
class ConditionCollectionView extends StatelessWidget {
  const ConditionCollectionView(this.disabledCollections, {super.key});
  final List<ProductCollection>? disabledCollections;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return GetBuilder<ConditionCollectionController>(
      init: ConditionCollectionController(
          collectionRepo: CollectionRepo(),
          disabledCollections: disabledCollections ?? []),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                                  operator:
                                      controller.discountConditionOperator,
                                  productCollections:
                                      controller.selectedCollections,
                                  conditionType:
                                      DiscountConditionType.productCollections);
                              Get.back(result: res);
                            }
                          : null,
                      child: const Text('Save')),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: Container(
                    height: kToolbarHeight,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    child: SearchTextField(
                      fillColor: context.theme.scaffoldBackgroundColor,
                      controller: controller.searchCtrl,
                      hintText: 'Search for collection name, handle',
                      onSuffixTap: () {
                        if (controller.searchTerm.isEmpty) return;
                        controller.searchCtrl.clear();
                        controller.searchTerm = '';
                        controller.pagingController.refresh();
                      },
                      onSubmitted: (val) {
                        if (controller.searchTerm != val && val.isNotEmpty) {
                          controller.searchTerm = val;
                          controller.pagingController.refresh();
                        }
                      },
                    ),
                  ),
                ),
              ),
              if (!controller.updateMode)
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
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
                  separatorBuilder: (_, __) =>
                      const Divider(height: 0, indent: 16),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<ProductCollection>(
                    itemBuilder: (context, collection, index) =>
                        ConditionCollectionListTile(
                      collection: collection,
                      value: controller.selectedCollections
                          .map((e) => e.id!)
                          .toList()
                          .contains(collection.id),
                      enabled: !controller.disabledCollections
                          .map((e) => e.id!)
                          .toList()
                          .contains(collection.id),
                      onChanged: (val) {
                        if (val == null) return;
                        if (val) {
                          controller.selectedCollections.add(collection);
                        } else {
                          controller.selectedCollections
                              .removeWhere((e) => e.id == collection.id);
                        }
                        controller.update();
                      },
                    ),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                            child: CircularProgressIndicator.adaptive()),
                    noItemsFoundIndicatorBuilder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('No collections found'),
                          if (controller.searchTerm.isNotEmpty)
                            AdaptiveButton(
                                onPressed: () {
                                  controller.searchTerm = '';
                                  controller.searchCtrl.clear();
                                  controller.pagingController.refresh();
                                },
                                child: const Text('Clear search')),
                        ],
                      );
                    },
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
  ConditionCollectionController(
      {required this.collectionRepo, required this.disabledCollections});
  final CollectionRepo collectionRepo;
  List<ProductCollection> selectedCollections = <ProductCollection>[];
  DiscountConditionOperator discountConditionOperator =
      DiscountConditionOperator.inn;
  final PagingController<int, ProductCollection> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final List<ProductCollection> disabledCollections;
  bool get updateMode => disabledCollections.isNotEmpty;
  final searchCtrl = TextEditingController();
  String searchTerm = '';
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await collectionRepo.retrieveAll(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        if (searchTerm.isNotEmpty) 'q': searchTerm,
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
