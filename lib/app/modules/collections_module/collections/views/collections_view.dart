import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../route/app_router.dart';
import '../../../../data/repository/collection/collection_repo.dart';
import '../components/index.dart';
import '../controllers/collections_controller.dart';

@RoutePage()
class CollectionsView extends StatelessWidget {
  const CollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionsController>(
        init: CollectionsController(collectionRepo: CollectionRepo()),
        builder: (controller) {
          return Scaffold(
            drawer: const AppDrawer(),
            drawerEdgeDragWidth: context.drawerEdgeDragWidth,
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () => context.pushRoute(MedusaSearchRoute(
                          searchCategory: SearchCategory.collections)),
                      heroTag: 'search collection',
                      child: const Icon(CupertinoIcons.search),
                    ),
                    const SizedBox(width: 4.0),
                  ],
                ),
                const SizedBox(height: 6.0),
                ScrollingExpandableFab(
                  controller: controller.scrollController,
                  label: 'New Collection',
                  icon: const Icon(Icons.add),
                  onPressed: () => context.pushRoute(CreateCollectionRoute()),
                ),
              ],
            ),
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () async => await controller.refreshData(),
              header: GetPlatform.isIOS
                  ? const ClassicHeader(completeText: '')
                  : const MaterialClassicHeader(offset: 100),
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    title: Obx(() => Text(
                        controller.collectionCount.value != 0
                            ? 'Collections (${controller.collectionCount.value})'
                            : 'Collections',
                        overflow: TextOverflow.ellipsis)),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: kToolbarHeight),
                    sliver: PagedSliverList(
                      pagingController: controller.pagingController,
                      builderDelegate:
                          PagedChildBuilderDelegate<ProductCollection>(
                        itemBuilder: (context, collection, index) =>
                            CollectionListTile(collection,
                                tileColor: index.isOdd
                                    ? context.theme.appBarTheme.backgroundColor
                                    : null),
                        firstPageProgressIndicatorBuilder: (context) =>
                            const CollectionsLoadingPage(),
                            firstPageErrorIndicatorBuilder: (context) =>
                                PaginationErrorPage(
                                    pagingController: controller.pagingController),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
}
