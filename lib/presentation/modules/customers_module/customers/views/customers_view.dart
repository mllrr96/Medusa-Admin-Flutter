import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/domain/use_case/customer_use_case.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/route/app_router.dart';
import '../components/index.dart';
import '../controllers/customers_controller.dart';

@RoutePage()
class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomersController>(
        init: CustomersController(customerUseCase: CustomerUseCase.instance),
        builder: (controller) {
          return GestureDetector(
            onTap: () => context.unfocus(),
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
                          searchCategory: SearchCategory.customers),
                      Gap(4.0),
                    ],
                  ),
                  const Gap(6.0),
                  ScrollingExpandableFab(
                    heroTag: UniqueKey(),
                    controller: controller.scrollController,
                    label: 'New Customer',
                    icon: const Icon(Icons.person_add),
                    onPressed: () async {
                      final result = await context
                          .pushRoute(AddUpdateCustomerRoute(customer: null));
                      if (result is bool) {
                        CustomersController.instance.pagingController.refresh();
                      }
                    },
                  ),
                ],
              ),
              body: SlidableAutoCloseBehavior(
                child: SmartRefresher(
                  controller: controller.refreshController,
                  onRefresh: () async => await controller.refreshData(),
                  header: const MaterialClassicHeader(),
                  child: CustomScrollView(
                    controller: controller.scrollController,
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        snap: true,
                        title: Obx(() => Text(
                            controller.customersCount.value != 0
                                ? 'Customers (${controller.customersCount.value})'
                                : 'Customers',
                            overflow: TextOverflow.ellipsis)),
                      ),
                      SliverPadding(
                        padding:
                        const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
                        sliver: PagedSliverList(
                          pagingController: controller.pagingController,
                          builderDelegate: PagedChildBuilderDelegate<Customer>(
                            itemBuilder: (context, customer, index) =>
                                CustomerListTile(
                              customer,
                              index: index,
                              onEditTap: (_) async {
                                final result = await context.pushRoute(AddUpdateCustomerRoute(customer: customer));
                                if (result is bool) {
                                  controller.pagingController.refresh();
                                }
                              },
                            ),
                            firstPageProgressIndicatorBuilder: (_) => const CustomersLoadingPage(),
                            firstPageErrorIndicatorBuilder: (context) =>
                                PaginationErrorPage(
                                    pagingController: controller.pagingController),
                          ),
                          // separatorBuilder: (_, __) => const Divider(height: 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
