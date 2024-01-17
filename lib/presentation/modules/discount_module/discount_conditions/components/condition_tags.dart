import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/modules/discount_module/discount_conditions/components/condition_tag_list_tile.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/domain/use_case/tags_use_case.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../controllers/discount_conditions_controller.dart';
import 'condition_operator_card.dart';

@RoutePage()
class ConditionTagView extends StatelessWidget {
  const ConditionTagView( {super.key,this.disabledTags});
  final List<ProductTag>? disabledTags;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return GetBuilder<ConditionTagController>(
      init: ConditionTagController(
          tagsUseCase: TagsUseCase.instance, disabledTags: disabledTags ?? []),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: const Text('Choose tags'),
                actions: [
                  TextButton(
                      onPressed: controller.selectedTags.isNotEmpty
                          ? () {
                              final result = DiscountConditionRes(
                                  operator:
                                      controller.discountConditionOperator,
                                  productTags: controller.selectedTags,
                                  conditionType:
                                      DiscountConditionType.productTags);
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
                      hintText: 'Search for tag name',
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
                  builderDelegate: PagedChildBuilderDelegate<ProductTag>(
                    itemBuilder: (context, tag, index) => ConditionTagListTile(
                        tag: tag,
                        value: controller.selectedTags
                            .map((e) => e.id!)
                            .toList()
                            .contains(tag.id),
                        enabled: !controller.disabledTags
                            .map((e) => e.id!)
                            .toList()
                            .contains(tag.id),
                        onChanged: (val) {
                          if (val == null) return;
                          if (val) {
                            controller.selectedTags.add(tag);
                          } else {
                            controller.selectedTags
                                .removeWhere((e) => e.id == tag.id);
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
                          const Text('No tags found'),
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

class ConditionTagController extends GetxController {
  ConditionTagController({required this.tagsUseCase, required this.disabledTags});
  final TagsUseCase tagsUseCase;
  List<ProductTag> selectedTags = <ProductTag>[];
  DiscountConditionOperator discountConditionOperator =
      DiscountConditionOperator.inn;
  final PagingController<int, ProductTag> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final List<ProductTag> disabledTags;
  final searchCtrl = TextEditingController();
  String searchTerm = '';
  bool get updateMode => disabledTags.isNotEmpty;
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
    final result = await tagsUseCase.retrieveProductTags(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        if (searchTerm.isNotEmpty) 'q': searchTerm
      },
    );

    result.when((success) {
      final isLastPage = success.tags!.length < _pageSize;
      update([5]);
      if (isLastPage) {
        pagingController.appendLastPage(success.tags!);
      } else {
        final nextPageKey = pageKey + success.tags!.length;
        pagingController.appendPage(success.tags!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error;
    });
  }
}
