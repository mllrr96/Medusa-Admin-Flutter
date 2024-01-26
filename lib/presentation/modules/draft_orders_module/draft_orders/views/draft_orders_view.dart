import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/draft_order/drafts_use_case.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/route/app_router.dart';
import '../../../../widgets/scrolling_expandable_fab.dart';
import '../components/index.dart';
import '../controllers/draft_orders_controller.dart';

@RoutePage()
class DraftOrdersView extends StatelessWidget {
  const DraftOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DraftOrdersController>(
        init: DraftOrdersController(draftsUseCase: DraftsUseCase.instance),
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
                        searchCategory: SearchCategory.draftOrders),
                    Gap(4.0),
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
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MedusaSliverAppBar(
                  title: Obx(() => Text(
                      controller.draftOrdersCount.value != 0
                          ? 'Drafts (${controller.draftOrdersCount.value})'
                          : 'Drafts',
                      overflow: TextOverflow.ellipsis)),
                ),
              ],
              body: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () async => await controller.refreshData(),
                child: PagedListView.separated(
                  pagingController: controller.pagingController,
                  padding: const EdgeInsets.only(
                      bottom: 120, top: 8.0, left: 8.0, right: 8.0),
                  builderDelegate: PagedChildBuilderDelegate<DraftOrder>(
                    itemBuilder: (context, draftOrder, index) =>
                        DraftOrderCard(draftOrder),
                    noItemsFoundIndicatorBuilder: (_) =>
                        const Center(child: Text('No draft orders yet!')),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const DraftsLoadingPage(),
                    firstPageErrorIndicatorBuilder: (context) =>
                        PaginationErrorPage(
                            pagingController: controller.pagingController),
                  ),
                  separatorBuilder: (_, __) => const Gap(8.0),
                ),
              ),
            ),
          );
        });
  }
}
