import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer_group.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../components/index.dart';
import '../controllers/groups_controller.dart';

@RoutePage()
class GroupsView extends StatelessWidget {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupsController>(
      init: GroupsController(customerGroupRepo: CustomerGroupRepo()),
      builder: (controller) {
        return GestureDetector(
          onTap: () => context.unfocus(),
          child: Scaffold(
            drawer: const AppDrawer(),
            drawerEdgeDragWidth: context.drawerEdgeDragWidth,
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () {
                        context.pushRoute(MedusaSearchRoute(
                            searchCategory: SearchCategory.groups));
                      },
                      heroTag: UniqueKey(),
                      child: const Icon(CupertinoIcons.search),
                    ),
                    const Gap(4.0),
                  ],
                ),
                const Gap(6.0),
                ScrollingExpandableFab(
                  heroTag: UniqueKey(),
                  controller: controller.scrollController,
                  label: 'New Group',
                  icon: const Icon(Icons.group_add),
                  onPressed: () async {
                    final result =
                        await context.pushRoute(CreateUpdateGroupRoute());
                    if (result is bool && result) {
                      GroupsController.instance.pagingController.refresh();
                    }
                  },
                ),
              ],
            ),
            body: SlidableAutoCloseBehavior(
              child: SmartRefresher(
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
                          controller.customerGroupsCount.value != 0
                              ? 'Groups (${controller.customerGroupsCount.value})'
                              : 'Groups',
                          overflow: TextOverflow.ellipsis)),
                    ),
                    SliverPadding(
                      padding:
                          const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
                      sliver: PagedSliverList.separated(
                        separatorBuilder: (_, __) => Divider(
                            height: 0, indent: GetPlatform.isIOS ? 16.0 : 0),
                        pagingController: controller.pagingController,
                        builderDelegate:
                            PagedChildBuilderDelegate<CustomerGroup>(
                          itemBuilder: (context, customerGroup, index) =>
                              GroupCard(
                                  customerGroup: customerGroup, index: index),
                          firstPageProgressIndicatorBuilder: (context) =>
                              const GroupsLoadingPage(),
                              firstPageErrorIndicatorBuilder: (context) =>
                                  PaginationErrorPage(
                                      pagingController: controller.pagingController),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
