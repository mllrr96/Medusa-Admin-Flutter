import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/cubits/product_types/product_types_cubit.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/data/models/discount_condition_res.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'condition_operator_card.dart';
import 'condition_type_list_tile.dart';

@RoutePage()
class ConditionTypeView extends StatefulWidget {
  const ConditionTypeView({super.key, this.disabledTypes});
  final List<ProductType>? disabledTypes;

  @override
  State<ConditionTypeView> createState() => _ConditionTypeViewState();
}

class _ConditionTypeViewState extends State<ConditionTypeView> {
  late ProductTypesCubit typesCubit;
  List<ProductType> selectedTypes = <ProductType>[];
  DiscountConditionOperator discountConditionOperator =
      DiscountConditionOperator.inn;
  final refreshController = RefreshController();
  final PagingController<int, ProductType> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  bool get updateMode => disabledTypes.isNotEmpty;
  final searchCtrl = TextEditingController();
  String searchTerm = '';
  List<ProductType> get disabledTypes => widget.disabledTypes ?? [];
  final int _pageSize = 20;

  void _loadPage(int pageKey) {
    typesCubit.load(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        if (searchTerm.isNotEmpty) 'q': searchTerm,
      },
    );
  }

  @override
  void initState() {
    typesCubit = ProductTypesCubit.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    typesCubit.close();
    searchCtrl.dispose();
    refreshController.dispose();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return BlocListener<ProductTypesCubit, ProductTypesState>(
      bloc: typesCubit,
      listener: (context, state) {
        state.maybeWhen(
            types: (types, _) async {
              final isLastPage = types.length < _pageSize;
              // if (refreshController.isRefresh) {
              //   pagingController.removePageRequestListener(_loadPage);
              //   pagingController.value = const PagingState(
              //       nextPageKey: null, error: null, itemList: null);
              //   await Future.delayed(const Duration(milliseconds: 250));
              // }
              if (isLastPage) {
                pagingController.appendLastPage(types);
              } else {
                final nextPageKey =
                    pagingController.nextPageKey ?? 0 + types.length;
                pagingController.appendPage(types, nextPageKey);
              }
              refreshController.refreshCompleted();
              // if (refreshController.isRefresh) {
              //   pagingController.addPageRequestListener(_loadPage);
              //   refreshController.refreshCompleted();
              // }
            },
            error: (error) {
              refreshController.refreshFailed();
              pagingController.error = error;
            },
            orElse: () {});
      },
      child: HideKeyboard(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: const Text('Choose types'),
                actions: [
                  IconButton(
                      onPressed: () => pagingController.refresh(),
                      icon: const Icon(Icons.refresh)),
                  TextButton(
                      onPressed: selectedTypes.isNotEmpty
                          ? () {
                              final result = DiscountConditionRes(
                                  operator: discountConditionOperator,
                                  productTypes: selectedTypes,
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
                      controller: searchCtrl,
                      hintText: 'Search for type',
                      onSuffixTap: () {
                        if (searchTerm.isEmpty) return;
                        searchCtrl.clear();
                        searchTerm = '';
                        pagingController.refresh();
                      },
                      onSubmitted: (val) {
                        if (searchTerm != val && val.isNotEmpty) {
                          searchTerm = val;
                          pagingController.refresh();
                        }
                      },
                    ),
                  ),
                ),
              ),
              if (!updateMode)
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Column(
                    children: [
                      ConditionOperatorCard(
                        conditionOperator: DiscountConditionOperator.inn,
                        groupValue: discountConditionOperator,
                        onTap: (val) {
                          setState(() => discountConditionOperator = val);
                        },
                      ),
                      space,
                      ConditionOperatorCard(
                        conditionOperator: DiscountConditionOperator.notIn,
                        groupValue: discountConditionOperator,
                        onTap: (val) {
                          setState(() => discountConditionOperator = val);
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
                  pagingController: pagingController,
                  builderDelegate: PagedChildBuilderDelegate<ProductType>(
                    itemBuilder: (context, type, index) =>
                        ConditionTypeListTile(
                            type: type,
                            value: selectedTypes
                                .map((e) => e.id!)
                                .toList()
                                .contains(type.id),
                            enabled: !disabledTypes
                                .map((e) => e.id!)
                                .toList()
                                .contains(type.id),
                            onChanged: (val) {
                              if (val == null) return;
                              if (val) {
                                selectedTypes.add(type);
                              } else {
                                selectedTypes
                                    .removeWhere((e) => e.id == type.id);
                              }
                              setState(() {});
                            }),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                            child: CircularProgressIndicator.adaptive()),
                    firstPageErrorIndicatorBuilder: (_) =>
                        PaginationErrorPage(pagingController: pagingController),
                    noItemsFoundIndicatorBuilder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('No types found'),
                          if (searchTerm.isNotEmpty)
                            TextButton(
                                onPressed: () {
                                  searchTerm = '';
                                  searchCtrl.clear();
                                  pagingController.refresh();
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
        ),
      ),
    );
  }
}
