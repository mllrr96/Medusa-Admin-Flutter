import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin/presentation/blocs/sales_channel_crud/sales_channel_crud_bloc.dart';
import 'package:medusa_admin/presentation/views/products/components/index.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/presentation/widgets/pick_products/controllers/pick_products_controller.dart';
import 'package:medusa_admin/presentation/widgets/pick_products/views/pick_products_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/index.dart';

@RoutePage()
class SalesChannelDetailsView extends StatefulWidget {
  const SalesChannelDetailsView(this.salesChannel, {super.key});

  final SalesChannel salesChannel;

  @override
  State<SalesChannelDetailsView> createState() =>
      _SalesChannelDetailsViewState();
}

class _SalesChannelDetailsViewState extends State<SalesChannelDetailsView> {
  late ProductCrudBloc productCrudBloc;
  late SalesChannelCrudBloc salesChannelCrudBloc;
  final pagingController = PagingController<int, Product>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();
  ProductFilter? productFilter;
  SalesChannel get salesChannel => widget.salesChannel;
  bool selectAll = false;
  List<String> selectedProducts = [];
  void _loadPage(int _) {
    Map<String, dynamic> queryParameters = {
      'offset': pagingController.itemList?.length ?? 0,
      'sales_channel_id': [salesChannel.id!, ''],
      'expand': 'collection,type,sales_channels',
      'fields': 'id,title,thumbnail,status',
    };

    if (productFilter != null) {
      queryParameters.addAll(productFilter!.toJson());
    }
    productCrudBloc
        .add(ProductCrudEvent.loadAll(queryParameters: queryParameters));
  }

  @override
  void initState() {
    productCrudBloc = ProductCrudBloc.instance;
    salesChannelCrudBloc = SalesChannelCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    productCrudBloc.close();
    salesChannelCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  void resetFilter() {
    if (productFilter == null || productFilter?.count() == 0) {
      return;
    }
    productFilter = null;
    pagingController.refresh();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final disabled = salesChannel.isDisabled != null && salesChannel.isDisabled!
        ? true
        : false;
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductCrudBloc, ProductCrudState>(
          bloc: productCrudBloc,
          listener: (context, state) {
            state.mapOrNull(
              products: (state) async {
                final isLastPage =
                    state.products.length < ProductCrudBloc.pageSize;
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
        BlocListener<SalesChannelCrudBloc, SalesChannelCrudState>(
            bloc: salesChannelCrudBloc,
            listener: (context, state) {
              state.maybeMap(
                  loading: (_) => loading(),
                  salesChannel: (_) {
                    pagingController.refresh();
                    selectedProducts.clear();
                    selectAll = false;
                    dismissLoading();
                    setState(() {});
                  },
                  deleted: (_) {
                    dismissLoading();
                    context.showSnackBar('Sales channel deleted');
                    context.popRoute(true);
                  },
                  error: (_) {
                    dismissLoading();
                    context.showSnackBar(_.failure.toSnackBarString());
                  },
                  orElse: () => dismissLoading());
            }),
      ],
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: context.defaultSystemUiOverlayStyle,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SalesChannelActiveDot(disabled),
              Text(salesChannel.name ?? ''),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                children: [
                  const SizedBox(width: 4.0),
                  Checkbox(
                      value: selectAll,
                      onChanged: (val) {
                        if (val == null ||
                            (pagingController.itemList?.isEmpty ?? true)) {
                          return;
                        }
                        if (val) {
                          selectedProducts.addAll(
                              pagingController.itemList?.map((e) => e.id!) ??
                                  []);
                          selectAll = true;
                        } else {
                          selectedProducts.clear();
                          selectAll = false;
                        }
                        setState(() {});
                      }),
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                    onLongPress: () {
                      resetFilter();
                    },
                    onTap: () async {
                      if (pagingController.itemList?.isEmpty ?? true) return;
                      Future<ProductFilter?> productFilterView() async =>
                          await showBarModalBottomSheet<ProductFilter>(
                              context: context,
                              backgroundColor:
                                  context.theme.scaffoldBackgroundColor,
                              overlayStyle:
                                  context.theme.appBarTheme.systemOverlayStyle,
                              builder: (context) => ProductsFilterView(
                                    onResetPressed: () {
                                      productFilter = null;
                                      setState(() {});
                                      pagingController.refresh();
                                      context.popRoute();
                                    },
                                    productFilter: productFilter,
                                  ));
                      productFilterView().then((result) {
                        if (result is ProductFilter) {
                          productFilter = result;
                          setState(() {});
                          pagingController.refresh();
                        }
                      });
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: (productFilter?.count() ?? 0) != 0
                                ? ColorManager.primary
                                : Colors.transparent),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6.0)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Filters',
                              style:
                                  context.bodySmall?.copyWith(color: manatee)),
                          if (productFilter?.count() != null)
                            Text(' ${productFilter?.count() ?? ''}',
                                style: context.bodySmall
                                    ?.copyWith(color: ColorManager.primary)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
                padding: const EdgeInsets.all(16.0),
                onPressed: () async {
                  await showModalActionSheet<int>(
                      title: 'Manage Sales Channel',
                      message: salesChannel.name ?? '',
                      context: context,
                      actions: <SheetAction<int>>[
                        const SheetAction(label: 'Edit General Info', key: 0),
                        const SheetAction(label: 'Add Products', key: 1),
                        if (pagingController.itemList?.isEmpty ?? false)
                          const SheetAction(
                              label: 'Delete',
                              isDestructiveAction: true,
                              key: 2),
                      ]).then((value) async {
                    switch (value) {
                      case 0:
                        // await Get.toNamed(Routes.ADD_UPDATE_SALES_CHANNEL, arguments: salesChannel)
                        //     ?.then((result) {
                        //   if (result is SalesChannel) {
                        //     salesChannel = result;
                        //     update();
                        //     SalesChannelsinstance.pagingrefresh();
                        //   }
                        // });
                        break;
                      case 1:
                        final result = await showBarModalBottomSheet(
                          context: context,
                          overlayStyle:
                              context.theme.appBarTheme.systemOverlayStyle,
                          backgroundColor:
                              context.theme.scaffoldBackgroundColor,
                          builder: (context) => PickProductsView(
                            pickProductsReq: PickProductsReq(
                              disabledProducts: pagingController.itemList,
                            ),
                          ),
                        );
                        if (result is PickProductsRes) {
                          final ids = result.selectedProducts
                              .map((e) => e.id!)
                              .toList();
                          salesChannelCrudBloc.add(
                              SalesChannelCrudEvent.addProducts(
                                  salesChannel.id!, ids));
                        }
                        break;
                      case 2:
                        salesChannelCrudBloc.add(
                            SalesChannelCrudEvent.delete(salesChannel.id!));
                        break;
                    }
                  });
                },
                icon: const Icon(Icons.more_horiz))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: selectedProducts.isNotEmpty
            ? SalesChannelFAB(
                selectedProductsCount: selectedProducts.length,
                onRemove: () {
                  salesChannelCrudBloc.add(SalesChannelCrudEvent.deleteProducts(
                      salesChannel.id!, selectedProducts));
                },
                onClear: () {
                  selectAll = false;
                  selectedProducts.clear();
                  setState(() {});
                },
              )
            : null,
        body: SafeArea(
          child: SlidableAutoCloseBehavior(
            child: PagedListView.separated(
              separatorBuilder: (_, __) => const Divider(height: 0, indent: 16),
              padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<Product>(
                itemBuilder: (context, product, index) =>
                    ProductCheckboxListTile(
                  product,
                  selected: selectedProducts.contains(product.id),
                  onRemove: () {
                    salesChannelCrudBloc.add(
                        SalesChannelCrudEvent.deleteProducts(
                            salesChannel.id!, [product.id!]));
                  },
                  onToggle: (val) {
                    if (val == null) return;
                    if (val) {
                      selectedProducts.add(product.id!);
                      if (selectedProducts.length ==
                          pagingController.itemList?.length) {
                        selectAll = true;
                      }
                    } else {
                      selectedProducts.remove(product.id);
                      selectAll = false;
                    }
                    setState(() {});
                  },
                ),
                firstPageProgressIndicatorBuilder: (_) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                firstPageErrorIndicatorBuilder: (_) =>
                    PaginationErrorPage(pagingController: pagingController),
                noItemsFoundIndicatorBuilder: (_) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Start building your channels setup...'),
                    const SizedBox(height: 12.0),
                    Text(
                      'You haven’t added any products to this channels yet,\nbut once you do they will live here.',
                      style: mediumTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12.0),
                    FilledButton(
                        onPressed: () async {
                          final result = await showBarModalBottomSheet(
                              context: context,
                              overlayStyle:
                                  context.theme.appBarTheme.systemOverlayStyle,
                              backgroundColor:
                                  context.theme.scaffoldBackgroundColor,
                              builder: (context) => PickProductsView(
                                      pickProductsReq: PickProductsReq(
                                    disabledProducts: pagingController.itemList,
                                  )));
                          if (result is PickProductsRes) {
                            final ids = result.selectedProducts
                                .map((e) => e.id!)
                                .toList();
                            salesChannelCrudBloc.add(
                                SalesChannelCrudEvent.addProducts(
                                    salesChannel.id!, ids));
                          }
                        },
                        child: const Text('Add products'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
