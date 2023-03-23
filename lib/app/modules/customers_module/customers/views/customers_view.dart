import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/customers_controller.dart';

class CustomersView extends GetView<CustomersController> {
  const CustomersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
          child: PagedListView.separated(
            padding: const EdgeInsets.all(12.0),
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Customer>(
                itemBuilder: (context, customer, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xffF473B6),
                        child: Text(
                            customer.firstName == null
                                ? customer.email[1].capitalize ?? customer.email[1]
                                : customer.firstName![1],
                            style: largeTextStyle!.copyWith(color: Colors.white)),
                      ),
                      title: customer.firstName != null
                          ? Text('${customer.firstName ?? ''} ${customer.lastName ?? ''}', style: mediumTextStyle)
                          : Text(customer.email, style: mediumTextStyle),
                      subtitle: customer.firstName != null ? Text(customer.email, style: mediumTextStyle) : null,
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
            separatorBuilder: (_, __) => const Divider(),
          ),
        ),
      ),
    );
  }
}
