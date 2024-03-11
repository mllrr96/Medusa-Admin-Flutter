import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/blocs/collection_crud/collection_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/utils/enums.dart';
import '../../../core/route/app_router.dart';
import 'components/index.dart';

@RoutePage()
class CollectionsView extends StatefulWidget {
  const CollectionsView({super.key});

  @override
  State<CollectionsView> createState() => _CollectionsViewState();
}

class _CollectionsViewState extends State<CollectionsView> {
  final RefreshController refreshController = RefreshController();
  final PagingController<int, ProductCollection> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  late CollectionCrudBloc collectionCrudBloc;

  void _loadPage(int _) {
    collectionCrudBloc.add(CollectionCrudEvent.loadAll(
        queryParameters: {
          'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
        }
    ));
  }

  @override
  void initState() {
    collectionCrudBloc = CollectionCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    collectionCrudBloc.close();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CollectionCrudBloc, CollectionCrudState>(
      bloc: collectionCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          collections: (state) async {
            final isLastPage =
                state.collections.length < CollectionCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.collections);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.collections.length;
              pagingController.appendPage(state.collections, nextPageKey);
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
        drawer: const AppDrawer(),
        drawerEdgeDragWidth: context.drawerEdgeDragWidth,
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchFloatingActionButton(
                    searchCategory: SearchCategory.collections),
                Gap(4.0),
              ],
            ),
            const Gap(6.0),
            ScrollingExpandableFab(
              controller: ScrollController(),
              heroTag: UniqueKey(),
              label: 'New Collection',
              icon: const Icon(Icons.add),
              onPressed: () => context.pushRoute(CreateCollectionRoute()),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: Builder(builder: (context) {
                final collectionsCount = collectionCrudBloc.state
                    .mapOrNull(collections: (state) => state.count) ?? 0;
                return Text(
                    collectionsCount != 0
                        ? 'Collections ($collectionsCount)'
                        : 'Collections',
                    overflow: TextOverflow.ellipsis);
              }),
            ),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            child: PagedListView(
              pagingController: pagingController,
              padding: const EdgeInsets.only(bottom: kToolbarHeight),
              builderDelegate: PagedChildBuilderDelegate<ProductCollection>(
                itemBuilder: (context, collection, index) => CollectionListTile(
                    collection,
                    tileColor: index.isOdd
                        ? context.theme.appBarTheme.backgroundColor
                        : null),
                firstPageProgressIndicatorBuilder: (context) =>
                    const CollectionsLoadingPage(),
                firstPageErrorIndicatorBuilder: (context) =>
                    PaginationErrorPage(pagingController: pagingController),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
