import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/features/product_tags/presentation/bloc/product_tags_bloc.dart';
import 'package:medusa_admin/src/features/product_tags/presentation/components/product_tag_tile.dart';
import 'package:medusa_admin/src/features/product_tags/presentation/components/product_tags_loading_page.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class ProductTagsView extends StatefulWidget {
  const ProductTagsView({super.key});

  @override
  State<ProductTagsView> createState() => _ProductTagsViewState();
}

class _ProductTagsViewState extends State<ProductTagsView> {
  late ProductTagsBloc productTagsBloc;
  final pagingController =
      PagingController<int, ProductTag>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();

  void _loadPage(int page) {
    productTagsBloc.add(
      ProductTagsEvent.loadProductTags({
        'offset': page == 0 ? 0 : pagingController.itemList?.length,
      }),
    );
  }

  @override
  void initState() {
    productTagsBloc = ProductTagsBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    productTagsBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductTagsBloc, ProductTagsState>(
      bloc: productTagsBloc,
      listener: (context, state) {
        state.mapOrNull(
          productTags: (state) async {
            final tags = state.productTags.productTags;
            final isLastPage = tags.length < ProductTagsBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value =
                  const PagingState(nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(tags);
            } else {
              final nextPageKey = pagingController.nextPageKey ?? 0 + tags.length;
              pagingController.appendPage(tags, nextPageKey);
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
          systemOverlayStyle: context.defaultSystemUiOverlayStyle,
          title: const Text('Product Tags'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final result = await context.pushRoute(AddUpdateProductTagRoute());
              if (result is ProductTag) {
                pagingController.refresh();
              }
            },
            child: const Icon(CupertinoIcons.add)),
        body: SafeArea(
            child: SmartRefresher(
          controller: refreshController,
          onRefresh: () => _loadPage(0),
          header: const MaterialClassicHeader(),
          child: PagedListView.separated(
            separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
            padding: const EdgeInsets.only(bottom: kToolbarHeight),
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<ProductTag>(
                animateTransitions: true,
                itemBuilder: (context, productTag, index) => ProductTagTile(
                      productTag,
                      onTap: () async {
                        final result = await context.pushRoute(ProductTagDetailsRoute(productTag: productTag));
                        if (result is bool && result == true) {
                          pagingController.refresh();
                        }
                      },
                    ),
                firstPageProgressIndicatorBuilder: (_) => const ProductTagsLoadingPage(),
                firstPageErrorIndicatorBuilder: (_) =>
                    PaginationErrorPage(pagingController: pagingController)),
          ),
        )),
      ),
    );
  }
}
