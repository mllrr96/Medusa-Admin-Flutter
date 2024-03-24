import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/blocs/category_crud/category_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final PagingController<int, ProductCategory> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();
  late CategoryCrudBloc categoryCrudBloc;

  void _loadPage(int _) {
    categoryCrudBloc.add(
      CategoryCrudEvent.loadAll(queryParameters: {
        'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
      }),
    );
  }

  @override
  void initState() {
    categoryCrudBloc = CategoryCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    categoryCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCrudBloc, CategoryCrudState>(
      bloc: categoryCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          categories: (state) async {
            final isLastPage =
                state.categories.length < CategoryCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.categories);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.categories.length;
              pagingController.appendPage(state.categories, nextPageKey);
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
          title: const Text('Categories'),
        ),
        drawer: const AppDrawer(),
        drawerEdgeDragWidth: context.drawerEdgeDragWidth,
        body: SafeArea(
          child: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            header: const MaterialClassicHeader(),
            child: PagedListView(
              pagingController: pagingController,
              padding: const EdgeInsets.only(bottom: kToolbarHeight),
              builderDelegate: PagedChildBuilderDelegate<ProductCategory>(
                  animateTransitions: true,
                  itemBuilder: (context, category, index) => ListTile(
                        title: Text(category.name ?? ''),
                      ),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  firstPageErrorIndicatorBuilder: (context) =>
                      PaginationErrorPage(pagingController: pagingController)),
            ),
          ),
        ),
      ),
    );
  }
}
