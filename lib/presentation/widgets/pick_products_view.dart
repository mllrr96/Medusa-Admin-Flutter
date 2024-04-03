import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/list_extension.dart';
import 'package:medusa_admin/data/models/pick_products_req.dart';
import 'package:medusa_admin/data/models/pick_products_res.dart';
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin/presentation/views/products/components/products_loading_page.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class PickProductsView extends StatefulWidget {
  const PickProductsView({super.key, this.pickProductsReq});
  final PickProductsReq? pickProductsReq;

  @override
  State<PickProductsView> createState() => _PickProductsViewState();
}

class _PickProductsViewState extends State<PickProductsView> {
  PickProductsReq get pickProductsReq =>
      widget.pickProductsReq ?? PickProductsReq();
  List<Product> selectedProducts = [];
  final pagingController = PagingController<int, Product>(
      firstPageKey: 0, invisibleItemsThreshold: 3);
  RefreshController refreshController = RefreshController();
  late ProductCrudBloc productsBloc;

  void _loadPage(int _) {
    productsBloc.add(ProductCrudEvent.loadAll(queryParameters: {
      'is_giftcard': false,
      'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
    }));
  }

  @override
  void initState() {
    selectedProducts =
        List<Product>.from(pickProductsReq.selectedProducts ?? []);
    productsBloc = ProductCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    productsBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return BlocListener<ProductCrudBloc, ProductCrudState>(
      bloc: productsBloc,
      listener: (context, state) {
        state.mapOrNull(
          products: (state) async {
            final isLastPage = state.products.length < ProductCrudBloc.pageSize;
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
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text('Products'),
          actions: [
            TextButton(
                onPressed: selectedProducts
                        .map((e) => e.id!)
                        .toList()
                        .listEquals(pickProductsReq.selectedProducts
                                ?.map((e) => e.id!)
                                .toList() ??
                            [])
                    ? null
                    : () => context.maybePop(PickProductsRes(
                        selectedProducts: selectedProducts,
                        deSelectedProducts: [
                          ...?pickProductsReq.selectedProducts
                        ]..removeWhere((e) =>
                            selectedProducts.map((e) => e.id).contains(e.id)))),
                child: const Text('Save'))
          ],
        ),
        body: SafeArea(
            child: PagedListView(
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<Product>(
            animateTransitions: true,
            itemBuilder: (context, product, index) {
              final enabled = pickProductsReq.disabledProducts != null
                  ? !pickProductsReq.disabledProducts!
                      .map((e) => e.id)
                      .toList()
                      .contains(product.id)
                  : true;
              return CheckboxListTile(
                enabled: enabled,
                title: Text(product.title!),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (pickProductsReq.includeVariantCount)
                      Text('Variants: ${product.variants?.length ?? '0'}',
                          style: smallTextStyle?.copyWith(
                              color: enabled ? null : manatee)),
                    _getStatusIcon(product.status),
                  ],
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: product.thumbnail != null
                    ? SizedBox(
                        width: 45,
                        child: CachedNetworkImage(
                          key: ValueKey(product.thumbnail!),
                          imageUrl: product.thumbnail!,
                          placeholder: (context, text) => const Center(
                              child: CircularProgressIndicator.adaptive()),
                          errorWidget: (context, string, error) => const Icon(
                              Icons.warning_rounded,
                              color: Colors.redAccent),
                        ))
                    : null,
                value: selectedProducts
                    .map((e) => e.id)
                    .toList()
                    .contains(product.id),
                selected: pickProductsReq.selectedProducts
                        ?.map((e) => e.id!)
                        .toList()
                        .contains(product.id) ??
                    false,
                onChanged: (value) {
                  if (value != null && value) {
                    selectedProducts.add(product);
                  } else if (value != null && !value) {
                    selectedProducts.removeWhere((e) => e.id == product.id);
                  }
                  setState(() {});
                  // controller.update();
                },
              );
            },
            firstPageProgressIndicatorBuilder: (context) =>
                const ProductsLoadingPage(),
            firstPageErrorIndicatorBuilder: (_) =>
                PaginationErrorPage(pagingController: pagingController),
          ),
        )),
      ),
    );
  }

  Widget _getStatusIcon(ProductStatus status) {
    switch (status) {
      case ProductStatus.draft:
        return const Icon(Icons.circle, color: Colors.grey, size: 12);
      case ProductStatus.proposed:
        return const Icon(Icons.circle, color: Colors.grey, size: 12);

      case ProductStatus.published:
        return const Icon(Icons.circle, color: Colors.green, size: 12);

      case ProductStatus.rejected:
        return const Icon(Icons.circle, color: Colors.red, size: 12);
    }
  }
}
