import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/data/models/discount_condition_res.dart';
import 'condition_operator_card.dart';
import 'condition_product_tile.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class ConditionProductView extends StatefulWidget {
  const ConditionProductView({super.key, this.disabledProducts});
  final List<Product>? disabledProducts;

  @override
  State<ConditionProductView> createState() => _ConditionProductViewState();
}

class _ConditionProductViewState extends State<ConditionProductView> {
  late ProductCrudBloc productCrudBloc;

  DiscountConditionOperator discountConditionOperator =
      DiscountConditionOperator.inn;
  final PagingController<int, Product> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  List<Product> selectedProducts = <Product>[];
  List<Product> get disabledProducts => widget.disabledProducts ?? [];

  bool get updateMode => disabledProducts.isNotEmpty;
  final searchCtrl = TextEditingController();
  String searchTerm = '';

  void _loadPage(int _) {
    productCrudBloc.add(ProductCrudEvent.loadAll(queryParameters: {
      'is_giftcard': false,
      'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
    }));
  }

  @override
  void initState() {
    productCrudBloc = ProductCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    productCrudBloc.close();
    pagingController.dispose();
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return BlocListener<ProductCrudBloc, ProductCrudState>(
      bloc: productCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          products: (state) async {
            final isLastPage = state.products.length < ProductCrudBloc.pageSize;
            if (isLastPage) {
              pagingController.appendLastPage(state.products);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.products.length;
              pagingController.appendPage(state.products, nextPageKey);
            }
          },
          error: (state) {
            pagingController.error = state.failure;
          },
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: const Text('Choose products'),
                actions: [
                  TextButton(
                      onPressed: selectedProducts.isNotEmpty
                          ? () {
                              final res = DiscountConditionRes(
                                  operator: discountConditionOperator,
                                  products: selectedProducts,
                                  conditionType:
                                      DiscountConditionType.products);
                              context.maybePop(res);
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
                      hintText: 'Search for product name, variant title ...',
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
                          discountConditionOperator = val;
                          setState(() {});
                        },
                      ),
                      space,
                      ConditionOperatorCard(
                        conditionOperator: DiscountConditionOperator.notIn,
                        groupValue: discountConditionOperator,
                        onTap: (val) {
                          discountConditionOperator = val;
                          setState(() {});
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
                  builderDelegate: PagedChildBuilderDelegate<Product>(
                    animateTransitions: true,
                    itemBuilder: (context, product, index) =>
                        ProductTileWithVariantCount(
                            enabled: !disabledProducts
                                .map((e) => e.id!)
                                .toList()
                                .contains(product.id),
                            product: product,
                            value: selectedProducts
                                .map((e) => e.id!)
                                .toList()
                                .contains(product.id),
                            onChanged: (val) {
                              if (val == null) return;
                              if (val) {
                                selectedProducts.add(product);
                              } else {
                                selectedProducts
                                    .removeWhere((e) => e.id == product.id);
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
                          const Text('No products found'),
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
