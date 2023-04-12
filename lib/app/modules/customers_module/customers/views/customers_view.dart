import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/modules/components/search_text_field.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/colors.dart';
import '../../../groups_module/groups/views/groups_view.dart';
import '../components/customers_app_bar.dart';
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
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const CustomerCustomAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Get.toNamed(Routes.UPDATE_CUSTOMER_DETAILS);
            if (result is bool) {
              CustomersController.instance.pagingController.refresh();
            }
          },
          child: const Icon(Icons.person_add),
        ),
        body: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
          child: PagedListView(
            // Adding bottom padding to prevent FAB from covering last item
            padding: const EdgeInsets.only(bottom: kToolbarHeight * 2),
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Customer>(
                itemBuilder: (context, customer, index) => ListTile(
                      horizontalTitleGap: 8,
                      tileColor: index.isOdd ? Theme.of(context).appBarTheme.backgroundColor : null,
                      leading: CircleAvatar(
                        backgroundColor: ColorManager.primary,
                        maxRadius: 18,
                        child: Text(
                            customer.firstName == null
                                ? customer.email[0].capitalize ?? customer.email[0]
                                : customer.firstName![0],
                            style: largeTextStyle!.copyWith(color: Colors.white)),
                      ),
                      title: customer.firstName != null
                          ? Text('${customer.firstName ?? ''} ${customer.lastName ?? ''}', style: mediumTextStyle)
                          : Text(customer.email, style: mediumTextStyle),
                      subtitle: customer.firstName != null ? Text(customer.email, style: mediumTextStyle) : null,
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (customer.createdAt != null)
                            Text(
                              DateFormat.yMMMd().format(customer.createdAt!),
                              style: smallTextStyle,
                            ),
                          if (customer.orders != null)
                            Text('Orders: ${customer.orders!.length}', style: smallTextStyle),
                        ],
                      ),
                      onTap: () => Get.toNamed(Routes.CUSTOMER_DETAILS, arguments: customer.id!),
                    ),
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive())),
            // separatorBuilder: (_, __) => const Divider(height: 0),
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
    final searchTerm = controller.searchTerm.value;
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      alignment: Alignment.center,
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Padding(
        padding: Platform.isIOS ? EdgeInsets.zero : const EdgeInsets.symmetric(vertical: 4.0),
        child: SearchTextField(
          controller: controller.searchCtrl,
          hintText: 'Search for customer name, email, phone number ...',
          onSuffixTap: () {
            controller.searchCtrl.clear();
            controller.searchTerm.value = '';
            FocusScope.of(context).unfocus();
          },
          onChanged: (val) {
            if (val.isEmpty && searchTerm.isNotEmpty) {
              controller.searchTerm.value = '';
            }

            if (searchTerm != val && val.isNotEmpty) {
              controller.searchTerm.value = val;
            }
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
