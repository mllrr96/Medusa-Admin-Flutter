import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/data/models/pick_products_req.dart';
import 'package:medusa_admin/data/models/pick_products_res.dart';
import 'package:medusa_admin/presentation/blocs/pricing/pricing_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/presentation/widgets/pick_products_view.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/index.dart';

@RoutePage()
class PriceListDetailsView extends StatefulWidget {
  const PriceListDetailsView(this.priceList, {super.key});
  final PriceList priceList;

  @override
  State<PriceListDetailsView> createState() => _PriceListDetailsViewState();
}

class _PriceListDetailsViewState extends State<PriceListDetailsView> {
  final refreshController = RefreshController();
  final pagingController = PagingController<int, Product>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  late PricingCrudBloc pricingCrudBloc;
  late PricingCrudBloc priceListBloc;
  void _loadPage(int _) {
    pricingCrudBloc.add(PricingCrudEvent.loadProducts(id));
  }

  String get id => widget.priceList.id!;

  @override
  void initState() {
    pricingCrudBloc = PricingCrudBloc.instance;
    priceListBloc = PricingCrudBloc.instance;
    priceListBloc.add(PricingCrudEvent.load(id));
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    pricingCrudBloc.close();
    priceListBloc.close();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PricingCrudBloc, PricingCrudState>(
          bloc: priceListBloc,
          listener: (context, state) {
            state.mapOrNull(
              products: (state) async {
                final isLastPage =
                    state.products.length < PricingCrudBloc.pageSize;
                if (refreshController.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);
                  pagingController.value = const PagingState(
                      nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(state.products);
                } else {
                  final nextPageKey =
                      pagingController.nextPageKey ?? 0 + state.products.length;
                  pagingController.appendPage(state.products, nextPageKey);
                }
                if (refreshController.isRefresh) {
                  pagingController.addPageRequestListener(_loadPage);
                  refreshController.refreshCompleted();
                }
              },
              error: (state) {
                refreshController.refreshFailed();
                pagingController.error = state.failure;
              },
            );
          },
        ),
        BlocListener<PricingCrudBloc, PricingCrudState>(
          bloc: pricingCrudBloc,
          listener: (context, state) {
            state.maybeMap(
              loading: (_) => loading(),
              deleted: (state) {
                state.mapOrNull(
                  deleted: (state) {
                    dismissLoading();
                    context.showSnackBar('Price list deleted');
                    context.popRoute();
                  },
                );
              },
              orElse: () => dismissLoading(),
            );
          },
        ),
      ],
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: context.defaultSystemUiOverlayStyle,
            title: const Text('Price List Details'),
            actions: [
              IconButton(
                  onPressed: () async {
                    await showModalActionSheet<int>(
                        context: context,
                        actions: <SheetAction<int>>[
                          const SheetAction(
                              label: 'Edit price list details', key: 0),
                          const SheetAction(label: 'Add Products', key: 1),
                          const SheetAction(
                              label: 'Remove price list',
                              isDestructiveAction: true,
                              key: 2),
                        ]).then((result) async {
                      switch (result) {
                        case 0:
                          context.pushRoute(AddUpdatePriceListRoute(id: id));
                          return;
                        case 1:
                          final pickProductsRes = await addProduct;
                          if (pickProductsRes is PickProductsRes && context.mounted) {
                            final prices = await showBarModalBottomSheet(
                              context: context,
                              backgroundColor:
                                  context.theme.scaffoldBackgroundColor,
                              enableDrag: false,
                              overlayStyle:
                                  context.theme.appBarTheme.systemOverlayStyle,
                              builder: (context) => PriceListAddProducts(
                                  pickProductsRes.selectedProducts),
                            );
                            if (prices is List<MoneyAmount> &&
                                context.mounted) {
                              pricingCrudBloc.add(PricingCrudEvent.updatePrices(
                                  id,
                                  UserUpdatePricesReq(
                                      prices: prices
                                          .map((e) => MoneyAmount(
                                              variantId: e.variantId,
                                              amount: e.amount,
                                              currencyCode: e.currencyCode))
                                          .toList())));
                            }
                          }
                          return;
                        case 2:
                          final confirmDelete = await showOkCancelAlertDialog(
                            context: context,
                            title: 'Delete price list',
                            message:
                                'Are you sure you want to delete this price list?',
                            okLabel: 'Yes, delete',
                            isDestructiveAction: true,
                          );
                          if (confirmDelete == OkCancelResult.ok &&
                              context.mounted) {
                            pricingCrudBloc.add(PricingCrudEvent.delete(id));
                          }
                          return;
                      }
                    });
                  },
                  icon: const Icon(Icons.more_horiz))
            ],
          ),
          body: SafeArea(
            child: SmartRefresher(
              controller: refreshController,
              onRefresh: () {
                _loadPage(0);
                priceListBloc.add(PricingCrudEvent.load(id));
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<PricingCrudBloc, PricingCrudState>(
                      bloc: priceListBloc,
                      builder: (context, state) => state.maybeMap(
                        pricingList: (_) => PriceListDetailsTile(_.priceList),
                        loading: (_) => PriceListDetailsTile(widget.priceList,
                            shimmer: true),
                        orElse: () => const SizedBox.shrink(),
                      ),
                    ),
                  ),
                  PagedSliverList.separated(
                    separatorBuilder: (_, __) =>
                        const Divider(height: 0, indent: 16),
                    pagingController: pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Product>(
                      itemBuilder: (context, product, index) =>
                          PriceListProductTile(
                        product,
                        onEditPricesTap: () async {
                          await context
                              .pushRoute(AddUpdateVariantsPriceRoute(
                                  product: product,
                                  prices: priceListBloc.state.mapOrNull(
                                      pricingList: (state) =>
                                          state.priceList.prices)))
                              .then((result) {
                            if (result is List<MoneyAmount>) {
                              priceListBloc.add(PricingCrudEvent.updatePrices(
                                  id,
                                  UserUpdatePricesReq(
                                      prices: result
                                          .map((e) => MoneyAmount(
                                              variantId: e.variantId,
                                              amount: e.amount,
                                              currencyCode: e.currencyCode))
                                          .toList())));
                            }
                          });
                        },
                        onRemoveProductTap: () async {
                          pricingCrudBloc.add(
                              PricingCrudEvent.deleteProduct(id, product.id!));
                          // await controller.deleteProduct(
                          //     context, product);
                        },
                      ),
                      firstPageProgressIndicatorBuilder: (context) =>
                          const PriceListProductsLoadingPage(),
                      firstPageErrorIndicatorBuilder: (_) =>
                          PaginationErrorPage(
                              pagingController: pagingController,
                              onRetry: () {
                                pagingController.refresh();
                                priceListBloc.add(PricingCrudEvent.load(id));
                              }),
                      noItemsFoundIndicatorBuilder: (context) {
                        return Center(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('No prices added yet'),
                            const SizedBox(height: 12.0),
                            FilledButton(
                              onPressed: () async {
                                final pickProductsRes = await addProduct;
                                if (pickProductsRes is PickProductsRes &&
                                    context.mounted) {
                                  final prices = await showBarModalBottomSheet(
                                    context: context,
                                    backgroundColor:
                                        context.theme.scaffoldBackgroundColor,
                                    enableDrag: false,
                                    overlayStyle: context
                                        .theme.appBarTheme.systemOverlayStyle,
                                    builder: (context) => PriceListAddProducts(
                                        pickProductsRes.selectedProducts),
                                  );
                                  if (prices is List<MoneyAmount> &&
                                      context.mounted) {
                                    // await controller.addPrices(
                                    //     context, prices);
                                  }
                                }
                              },
                              child: const Text('Add Products'),
                            ),
                          ],
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<PickProductsRes?> get addProduct async =>
      await showBarModalBottomSheet(
        context: context,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
        builder: (context) => PickProductsView(
          pickProductsReq: PickProductsReq(
            disabledProducts: pagingController.itemList,
            includeVariantCount: true,
          ),
        ),
      );
}
