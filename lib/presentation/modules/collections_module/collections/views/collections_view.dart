import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/collection/collections_use_case.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/route/app_router.dart';
import '../components/index.dart';
import '../controllers/collections_controller.dart';

@RoutePage()
class CollectionsView extends StatelessWidget {
  const CollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionsController>(
      init: CollectionsController(
          collectionsUseCase: CollectionsUseCase.instance),
      builder: (controller) {
        return Scaffold(
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
                controller: controller.scrollController,
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
                title: Obx(() => Text(
                    controller.collectionCount.value != 0
                        ? 'Collections (${controller.collectionCount.value})'
                        : 'Collections',
                    overflow: TextOverflow.ellipsis)),
              ),
            ],
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () async => await controller.refreshData(),
              child: PagedListView(
                pagingController: controller.pagingController,
                padding: const EdgeInsets.only(bottom: kToolbarHeight),
                builderDelegate: PagedChildBuilderDelegate<ProductCollection>(
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
          ),
        );
      },
    );
  }
}
