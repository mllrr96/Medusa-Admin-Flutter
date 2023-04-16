import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/modules/components/search_text_field.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../components/adaptive_button.dart';
import '../../../groups_module/groups/views/groups_view.dart';
import '../components/index.dart';
import '../controllers/customers_controller.dart';

class CustomersView extends GetView<CustomersController> {
  const CustomersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = controller.tabController;
    return Scaffold(
      appBar: CustomersTabBar(tabController: tabController, topViewPadding: MediaQuery.of(context).viewPadding.top),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            _Customers(),
            GroupsView(),
          ],
        ),
      ),
    );
  }
}

class _Customers extends GetView<CustomersController> {
  const _Customers();

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // ignore: prefer_const_constructors
        appBar: CustomerCustomAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Get.toNamed(Routes.UPDATE_CUSTOMER_DETAILS);
            if (result is bool) {
              CustomersController.instance.pagingController.refresh();
            }
          },
          child: const Icon(Icons.person_add),
        ),
        body: SlidableAutoCloseBehavior(
          child: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: () => controller.pagingController.refresh(),
            header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
            child: PagedListView(
              // Adding bottom padding to prevent FAB from covering last item
              padding: const EdgeInsets.only(bottom: kToolbarHeight * 2),
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Customer>(
                itemBuilder: (context, customer, index) => CustomerListTile(
                  customer,
                  index: index,
                  onEditTap: (_) async {
                    final result = await Get.toNamed(Routes.UPDATE_CUSTOMER_DETAILS, arguments: customer);
                    if (result is bool) {
                      controller.pagingController.refresh();
                    }
                  },
                ),
                firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                noItemsFoundIndicatorBuilder: (_) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (controller.searchTerm.value.isEmpty) Text('No customers yet!', style: mediumTextStyle),
                    if (controller.searchTerm.value.isNotEmpty) Text('No customers found', style: mediumTextStyle),
                  ],
                ),
              ),
              // separatorBuilder: (_, __) => const Divider(height: 0),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomerCustomAppBar extends GetView<CustomersController> with PreferredSizeWidget {
  const CustomerCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      alignment: Alignment.center,
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Expanded(
            child: SearchTextField(
              focusNode: controller.focusNode,
              controller: controller.searchCtrl,
              hintText: 'Search for customer name, email, phone number ...',
              onSuffixTap: () {
                controller.searchCtrl.clear();
                controller.searchTerm.value = '';
                FocusScope.of(context).unfocus();
              },
              onChanged: (val) {
                if (val.isEmpty && controller.searchTerm.value.isNotEmpty) {
                  controller.searchTerm.value = '';
                }
                if (controller.searchTerm.value != val && val.isNotEmpty) {
                  controller.searchTerm.value = val;
                }
              },
            ),
          ),
          Obx(() {
            return AnimatedCrossFade(
              sizeCurve: Curves.ease,
              firstChild: AdaptiveButton(
                  onPressed: () {
                    controller.focusNode.unfocus();
                    controller.searchCtrl.clear();
                    if (controller.searchTerm.value.isNotEmpty) {
                      controller.searchTerm.value = '';
                    }
                  },
                  padding: const EdgeInsets.only(left: 12.0),
                  child: const Text('Cancel', maxLines: 1)),
              secondChild: const SizedBox.shrink(),
              crossFadeState: controller.focused.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 250),
            );
          }),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
