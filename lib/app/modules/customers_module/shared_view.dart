import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../groups_module/groups/views/groups_view.dart';
import 'customers/components/customers_app_bar.dart';
import 'customers/controllers/customers_controller.dart';
import 'customers/views/customers_view.dart';

class CustomersGroupsTabBarView extends GetView<CustomersController> {
  const CustomersGroupsTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = controller.tabController;
    return Scaffold(
      appBar: CustomersGroupsTabBar(tabController: tabController, topViewPadding: MediaQuery.of(context).viewPadding.top),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: const [
            CustomersView(),
            GroupsView(),
          ],
        ),
      ),
    );
  }
}