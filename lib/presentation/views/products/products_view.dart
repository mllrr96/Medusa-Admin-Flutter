import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/product_extension.dart';
import 'package:medusa_admin/data/models/update_product_req.dart';
import 'package:medusa_admin/domain/use_case/batch_job/bach_job_crud_use_case.dart';
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/utils/enums.dart';
import 'components/index.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final pagingController = PagingController<int, Product>(
      firstPageKey: 0, invisibleItemsThreshold: 3);
  RefreshController refreshController = RefreshController();
  SortOptions sortOptions = SortOptions.dateRecent;
  ProductFilter? productFilter;
  late ProductCrudBloc productCrudBloc;
  late ProductCrudBloc productsBloc;
  String loadingProductId = '';

  void _loadPage(int _) {
    productsBloc.add(ProductCrudEvent.loadAll(queryParameters: {
      'order': sortOptions.map(),
      'is_giftcard': false,
      'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
      ...?productFilter?.toJson()
    }));
  }

  @override
  void initState() {
    productCrudBloc = ProductCrudBloc.instance;
    productsBloc = ProductCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    pagingController.dispose();
    refreshController.dispose();
    productCrudBloc.close();
    productsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductCrudBloc, ProductCrudState>(
          bloc: productsBloc,
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
        BlocListener<ProductCrudBloc, ProductCrudState>(
            bloc: productCrudBloc,
            listener: (BuildContext context, ProductCrudState state) {
              state.mapOrNull(
                loading: (_) {
                  setState(() => loadingProductId = _.id ?? '');
                },
                product: (_) {
                  // refreshController.headerMode!.value = RefreshStatus.refreshing;
                  // _loadPage(0);
                  pagingController.refresh();
                  loadingProductId = '';
                },
                deleted: (_) {
                  pagingController.refresh();
                  loadingProductId = '';
                },
                updated: (_) {
                  pagingController.refresh();
                  // _loadPage(0);
                  loadingProductId = '';
                },
                error: (state) {
                  context.showSnackBar(state.failure.toSnackBarString());
                  loadingProductId = '';
                },
              );
              // setState(() {});
            }),
      ],
      child: Scaffold(
        drawer: const AppDrawer(),
        drawerEdgeDragWidth: context.drawerEdgeDragWidth,
        endDrawer: Drawer(
          child: ProductsFilterView(
            onResetPressed: () {
              if (productFilter == null || productFilter?.count() == 0) {
                return;
              }
              productFilter = null;
              pagingController.refresh();
              context.popRoute();
            },
            productFilter: productFilter,
            onSubmitted: (productFilter) {
              if (productFilter == null) {
                return;
              }
              setState(() => this.productFilter = productFilter);
              pagingController.refresh();
              context.popRoute();
            },
          ),
        ),
        floatingActionButton: Directionality(
          textDirection: context.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SearchFloatingActionButton(
                      searchCategory: SearchCategory.products),
                  Gap(4.0),
                ],
              ),
              const Gap(6.0),
              SpeedDial(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                animatedIcon: AnimatedIcons.menu_close,
                spacing: 10,
                children: [
                  SpeedDialChild(
                    child: const Icon(Icons.add),
                    label: 'New Product',
                    labelStyle: smallTextStyle,
                    onTap: () async {
                      await context
                          .pushRoute(
                              AddUpdateProductRoute(updateProductReq: null))
                          .then((result) {
                        if (result is bool && result == true) {
                          pagingController.refresh();
                        }
                      });
                    },
                    onLongPress: () {},
                  ),
                  SpeedDialChild(
                    child: const Icon(MedusaIcons.arrow_down_tray),
                    label: 'Import Products',
                    labelStyle: smallTextStyle,
                    onTap: () async {
                      await context.pushRoute(const ImportProductsRoute());
                    },
                    onLongPress: () {},
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.cloud_upload_rounded),
                    label: 'Export Products',
                    labelStyle: smallTextStyle,
                    onTap: () async {
                      if (await exportProducts) {
                        final result = await BatchJobCrudUseCase.instance.create(
                            BatchJobType.productExport);
                        result.when((success) {
                          context.showSnackBar('Export started');
                        }, (error) {
                          context.showSnackBar(error.message);
                        });
                      }
                    },
                    onLongPress: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              // centerTitle: true,
              title: Builder(builder: (context) {
                final productsCount = productsBloc.state
                        .mapOrNull(products: (state) => state.count) ??
                    0;
                return Text(
                    productsCount > 0
                        ? 'Products ($productsCount)'
                        : 'Products',
                    overflow: TextOverflow.ellipsis);
              }),
              actions: [
                IconButton(
                    padding: const EdgeInsets.all(16.0),
                    onPressed: () async {
                      final result = await sortOptionsSheet;
                      if (result != null) {
                        setState(() => sortOptions = result);
                        pagingController.refresh();
                      }
                    },
                    icon: const Icon(CupertinoIcons.sort_up)),
                Builder(
                  builder: (context) {
                    final iconColor =
                        (productFilter?.count() ?? -1) > 0 ? Colors.red : null;
                    return IconButton(
                        padding: const EdgeInsets.all(16.0),
                        onPressed: () => context.openEndDrawer(),
                        icon: Icon(Icons.sort, color: iconColor));
                  },
                ),
              ],
            ),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            // onRefresh: () async => await controller.refreshData(),
            child: PagedListView.separated(
              separatorBuilder: (_, __) => const Divider(height: 0, indent: 16),
              padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<Product>(
                itemBuilder: (context, product, index) => Skeletonizer(
                  enabled: product.id == loadingProductId,
                  child: ProductListTile(
                    product: product,
                    onEdit: () async {
                      final result = await context.pushRoute(
                          AddUpdateProductRoute(
                              updateProductReq: UpdateProductReq(
                                  product: product, number: 7)));
                      if (result != null) {
                        pagingController.refresh();
                      }
                    },
                    onDelete: () async {
                      if (await confirmDelete) {
                        productCrudBloc
                            .add(ProductCrudEvent.delete(product.id!));
                      }
                    },
                    onPublish: () async {
                      productCrudBloc.add(ProductCrudEvent.update(
                          product.id!,
                          UserPostUpdateProductReq(
                            status: product.status == ProductStatus.draft
                                ? ProductStatus.published
                                : ProductStatus.draft,
                          )));
                    },
                    onDuplicate: () async {
                      productCrudBloc.add(ProductCrudEvent.create(
                          UserPostProductReq(
                              product: product.duplicate(
                                  title: '${product.title ?? ''} (copy)',
                                  handle: '${product.handle ?? ''}-copy'))));
                    },
                  ),
                ),
                firstPageProgressIndicatorBuilder: (_) =>
                    const ProductsLoadingPage(),
                noItemsFoundIndicatorBuilder: (_) {
                  if ((productFilter?.count() ?? -1) > 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('No products found'),
                        const Gap(10.0),
                        FilledButton(
                            onPressed: () {
                              if (productFilter == null ||
                                  productFilter?.count() == 0) {
                                return;
                              }
                              productFilter = null;
                              pagingController.refresh();
                            },
                            child: const Text('Clear filters'))
                      ],
                    );
                  }

                  return const Center(child: Text('No products'));
                },
                firstPageErrorIndicatorBuilder: (context) =>
                    PaginationErrorPage(pagingController: pagingController),
                animateTransitions: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> get exportProducts async => await showOkCancelAlertDialog(
        context: context,
        title: 'Export Products',
        message: 'Are you sure you want to initialize exporting all products?',
        okLabel: 'Export',
        cancelLabel: 'Cancel',
      ).then((result) => result == OkCancelResult.ok);

  Future<bool> get confirmDelete async => await showOkCancelAlertDialog(
          context: context,
          title: 'Confirm product deletion',
          message:
              'Are you sure you want to delete this product? \n This action is irreversible',
          isDestructiveAction: true)
      .then((value) => value == OkCancelResult.ok);

  Future<SortOptions?> get sortOptionsSheet async =>
      await showModalActionSheet<SortOptions>(
          context: context,
          title: 'Sort products',
          actions: <SheetAction<SortOptions>>[
            SheetAction(
                label: 'A-Z',
                key: SortOptions.aZ,
                isDestructiveAction: sortOptions == SortOptions.aZ),
            SheetAction(
                label: 'Z-A',
                key: SortOptions.zA,
                isDestructiveAction: sortOptions == SortOptions.zA),
            SheetAction(
                label: 'Creation Date',
                key: SortOptions.dateRecent,
                isDestructiveAction: sortOptions == SortOptions.dateRecent),
            SheetAction(
                label: 'Creation Date - Ascending',
                key: SortOptions.dateOld,
                isDestructiveAction: sortOptions == SortOptions.dateOld),
          ]);
}
