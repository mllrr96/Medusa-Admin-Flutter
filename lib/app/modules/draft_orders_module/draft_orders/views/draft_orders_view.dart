import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/draft_order.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../route/app_router.dart';
import '../../../../data/repository/draft_order/draft_order_repo.dart';
import '../../../components/scrolling_expandable_fab.dart';
import '../components/index.dart';
import '../controllers/draft_orders_controller.dart';

@RoutePage()
class DraftOrdersView extends StatelessWidget {
  const DraftOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DraftOrdersController>(
        init: DraftOrdersController(draftOrderRepo: DraftOrderRepo()),
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
                          searchCategory: SearchCategory.draftOrders)),
                      heroTag: 'search Draft Order',
                      child: const Icon(CupertinoIcons.search),
                    ),
                    const Gap(4.0),
                  ],
                ),
                const Gap(6.0),
                ScrollingExpandableFab(
                    controller: controller.scrollController,
                    label: 'Draft Order',
                    icon: const Icon(Icons.add),
                    onPressed: () =>
                        context.pushRoute(const CreateDraftOrderRoute()),
                    heroTag: 'Draft Order'),
              ],
            ),
            body: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () async {
                  await controller.refreshData();
                },
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
                          controller.draftOrdersCount.value != 0
                              ? 'Drafts (${controller.draftOrdersCount.value})'
                              : 'Drafts',
                          overflow: TextOverflow.ellipsis)),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                          12.0, 12.0, 12.0, kToolbarHeight * 2),
                      sliver: PagedSliverList.separated(
                        pagingController: controller.pagingController,
                        builderDelegate:
                            PagedChildBuilderDelegate<DraftOrder>(
                                itemBuilder: (context, draftOrder, index) =>
                                    DraftOrderCard(draftOrder),
                                noItemsFoundIndicatorBuilder: (_) =>
                                    const Center(
                                        child: Text('No draft orders yet!')),
                                firstPageProgressIndicatorBuilder:
                                    (context) => const DraftsLoadingPage(),
                            ),
                        separatorBuilder: (_, __) => const Gap(12.0),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
