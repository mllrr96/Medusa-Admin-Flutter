import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/products_module/products/components/products_collections_app_bar.dart';
import 'package:medusa_admin/app/modules/products_module/products/controllers/products_controller.dart';
import 'package:medusa_admin/app/modules/products_module/products/views/products_view.dart';

import '../collections_module/collections/views/collections_view.dart';
import '../components/keep_alive_widget.dart';

class ProductsCollectionsTabBarView extends GetView<ProductsController> {
  const ProductsCollectionsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = controller.tabController;

    return Scaffold(
      appBar: ProductsCollectionsTabBarAppBar(
          tabController: tabController, topViewPadding: MediaQuery.of(context).viewPadding.top),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: const [
            KeepAliveWidget(child: ProductsView()),
            KeepAliveWidget(child: CollectionsView()),
            // const KeepAliveWidget(child: CategoriesView()),
          ],
        ),
      ),
    );
  }
}
