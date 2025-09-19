import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/features/product_types/presentation/bloc/product_types_bloc.dart';
import 'package:medusa_admin/src/features/product_types/presentation/components/product_type_tile.dart';
import 'package:medusa_admin/src/features/product_types/presentation/components/product_types_loading_page.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

@RoutePage()
class ProductTypesView extends StatefulWidget {
  const ProductTypesView({super.key});

  @override
  State<ProductTypesView> createState() => _ProductTypesViewState();
}

class _ProductTypesViewState extends State<ProductTypesView> {
  late ProductTypesBloc productTypesBloc;
  final pagingController =
      PagingController<int, ProductType>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();

  void _loadPage(int page) {
    productTypesBloc.add(
      ProductTypesEvent.loadProductTypes({
        'offset': page == 0 ? 0 : pagingController.itemList?.length,
      }),
    );
  }

  @override
  void initState() {
    productTypesBloc = ProductTypesBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    productTypesBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductTypesBloc, ProductTypesState>(
      bloc: productTypesBloc,
      listener: (context, state) {
        state.mapOrNull(
          productTypes: (state) async {
            final isLastPage = state.productTypesRes.productTypes.length < ProductTypesBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value =
                  const PagingState(nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.productTypesRes.productTypes);
            } else {
              final nextPageKey = pagingController.nextPageKey ?? 0 + state.productTypesRes.productTypes.length;
              pagingController.appendPage(state.productTypesRes.productTypes, nextPageKey);
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
          title: const Text('Product Types'),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight / 2),
              child: Container(
                height: kToolbarHeight / 2,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text('Organize your products into types.',
                                style: context.bodySmall?.copyWith(color: ColorManager.manatee)))),
                    const Divider(height: 0),
                  ],
                ),
              )),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final result = await context.pushRoute(AddUpdateProductTypeRoute());
              if (result is ProductType) {
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
            builderDelegate: PagedChildBuilderDelegate<ProductType>(
                animateTransitions: true,
                itemBuilder: (context, productType, index) => ProductTypeTile(
                      productType,
                      onTap: () async {
                        final result = await context.pushRoute(ProductTypeDetailsRoute(productType: productType));
                        if (result is bool && result == true) {
                          pagingController.refresh();
                        }
                      },
                    ),
                firstPageProgressIndicatorBuilder: (_) => const ProductTypesLoadingPage(),
                noItemsFoundIndicatorBuilder: (_) => Center(
                      child: Text(
                        'No Product Types Found',
                        style: context.bodyMedium?.copyWith(fontSize: 16),
                      ),
                    ),
                firstPageErrorIndicatorBuilder: (_) =>
                    PaginationErrorPage(pagingController: pagingController)),
          ),
        )),
      ),
    );
  }
}