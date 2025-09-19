import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/features/products/presentation/bloc/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class ProductTagDetailsView extends StatefulWidget {
  const ProductTagDetailsView(this.productTag, {super.key});

  final ProductTag productTag;

  @override
  State<ProductTagDetailsView> createState() => _ProductTagDetailsViewState();
}

class _ProductTagDetailsViewState extends State<ProductTagDetailsView> {
  late ProductCrudBloc _productCrudBloc;
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final RefreshController _refreshController = RefreshController();

  void _loadPage(int page) {
    _productCrudBloc.add(
      ProductCrudEvent.loadAll(queryParameters: {
        'tag_id': widget.productTag.id,
        'offset': page == 0 ? 0 : _pagingController.itemList?.length ?? 0,
      }),
    );
  }

  @override
  void initState() {
    _productCrudBloc = ProductCrudBloc.instance;
    _pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    _productCrudBloc.close();
    _pagingController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCrudBloc, ProductCrudState>(
      bloc: _productCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          products: (state) async {
            final isLastPage = state.products.length < ProductCrudBloc.pageSize;
            if (_refreshController.isRefresh) {
              _pagingController.removePageRequestListener(_loadPage);
              _pagingController.value =
                  const PagingState(nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              _pagingController.appendLastPage(state.products);
            } else {
              final nextPageKey = _pagingController.nextPageKey ?? 0 + state.products.length;
              _pagingController.appendPage(state.products, nextPageKey);
            }
            if (_refreshController.isRefresh) {
              _pagingController.addPageRequestListener(_loadPage);
              _refreshController.refreshCompleted();
            }
          },
          error: (state) {
            _refreshController.refreshFailed();
            _pagingController.error = state.failure;
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.productTag.value),
        ),
        body: SafeArea(
          child: SmartRefresher(
            controller: _refreshController,
            onRefresh: () => _loadPage(0),
            header: const MaterialClassicHeader(),
            child: PagedListView.separated(
              separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
              padding: const EdgeInsets.only(bottom: kToolbarHeight),
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Product>(
                animateTransitions: true,
                itemBuilder: (context, product, index) => ListTile(
                  title: Text(product.title),
                ),
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                firstPageErrorIndicatorBuilder: (_) =>
                    PaginationErrorPage(pagingController: _pagingController),
                noItemsFoundIndicatorBuilder: (context) =>
                    const Center(child: Text('No products found')),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
