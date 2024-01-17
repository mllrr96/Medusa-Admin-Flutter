import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/modules/discount_module/discount_conditions/components/condition_type_list_tile.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/domain/use_case/types_use_case.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../controllers/discount_conditions_controller.dart';
import 'condition_operator_card.dart';

@RoutePage()
class ConditionTypeView extends StatelessWidget {
  const ConditionTypeView({super.key,this.disabledTypes});
  final List<ProductType>? disabledTypes;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return GetBuilder<ConditionTypeController>(
      init: ConditionTypeController(
          typesUseCase: TypesUseCase.instance, disabledTypes: disabledTypes ?? []),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: const Text('Choose types'),
                actions: [
                  TextButton(
                      onPressed: controller.selectedTypes.isNotEmpty
                          ? () {
                              final result = DiscountConditionRes(
                                  operator:
                                      controller.discountConditionOperator,
                                  productTypes: controller.selectedTypes,
                                  conditionType:
                                      DiscountConditionType.productType);
                              context.popRoute(result);
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
                      hintText: 'Search for type',
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
                  builderDelegate: PagedChildBuilderDelegate<ProductType>(
                    itemBuilder: (context, type, index) =>
                        ConditionTypeListTile(
                            type: type,
                            value: controller.selectedTypes
                                .map((e) => e.id!)
                                .toList()
                                .contains(type.id),
                            enabled: !controller.disabledTypes
                                .map((e) => e.id!)
                                .toList()
                                .contains(type.id),
                            onChanged: (val) {
                              if (val == null) return;
                              if (val) {
                                controller.selectedTypes.add(type);
                              } else {
                                controller.selectedTypes
                                    .removeWhere((e) => e.id == type.id);
                              }
                              controller.update();
                            }),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                            child: CircularProgressIndicator.adaptive()),
                    firstPageErrorIndicatorBuilder: (_) => PaginationErrorPage(
                        pagingController: controller.pagingController),
                    noItemsFoundIndicatorBuilder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('No types found'),
                          if (controller.searchTerm.isNotEmpty)
                            TextButton(
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

class ConditionTypeController extends GetxController {
  ConditionTypeController(
      {required this.typesUseCase, required this.disabledTypes});
  final TypesUseCase typesUseCase;
  List<ProductType> selectedTypes = <ProductType>[];
  DiscountConditionOperator discountConditionOperator =
      DiscountConditionOperator.inn;
  final PagingController<int, ProductType> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final List<ProductType> disabledTypes;
  bool get updateMode => disabledTypes.isNotEmpty;
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
  void onClose() {
    searchCtrl.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await typesUseCase.retrieveProductTypes(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        if (searchTerm.isNotEmpty) 'q': searchTerm,
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
      pagingController.error = error;
    });
  }
}
