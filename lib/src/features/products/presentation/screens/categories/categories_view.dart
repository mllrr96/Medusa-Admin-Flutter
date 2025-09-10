import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/features/products/presentation/bloc/category_crud/category_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';

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

  void _loadPage(int page) {
    categoryCrudBloc.add(
      CategoryCrudEvent.loadAll(queryParameters: {
        'offset': page == 0 ? 0 : pagingController.itemList?.length,
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
            final isLastPage = state.categories.length < CategoryCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value =
                  const PagingState(nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.categories);
            } else {
              final nextPageKey = pagingController.nextPageKey ?? 0 + state.categories.length;
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
                        onTap: () {},
                        title: Text(category.name),
                        subtitle: (category.description?.isNotEmpty ?? false)
                            ? Text(category.description!)
                            : null,
                        trailing: Column(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            category.isActive ? 'Active' : 'Inactive',
                            style: TextStyle(
                              color: category.isActive ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           const Gap(4),
                           Text(
                            category.isInternal ? 'Internal' : 'Public',
                            style: TextStyle(
                              color: category.isActive ? Colors.green : Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ]),
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
