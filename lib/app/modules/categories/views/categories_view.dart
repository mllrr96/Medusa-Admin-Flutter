import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/categories_controller.dart';

@RoutePage()
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
        init: CategoriesController(categoryRepo: getIt<MedusaAdmin>().productCategoryRepository),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Categories'),
            ),
            drawer: const AppDrawer(),
            drawerEdgeDragWidth: context.drawerEdgeDragWidth,
            body: SafeArea(
              child: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () => controller.pagingController.refresh(),
                header:  const MaterialClassicHeader(),
                child: PagedListView(
                  pagingController: controller.pagingController,
                  padding: const EdgeInsets.only(bottom: kToolbarHeight),
                  builderDelegate: PagedChildBuilderDelegate<ProductCategory>(
                      itemBuilder: (context, category, index) => ListTile(
                            title: Text(category.name ?? ''),
                          ),
                      firstPageProgressIndicatorBuilder: (context) =>
                          const Center(
                              child: CircularProgressIndicator.adaptive()),
                      firstPageErrorIndicatorBuilder: (context) =>
                          PaginationErrorPage(
                              pagingController: controller.pagingController)),
                ),
              ),
            ),
          );
        });
  }
}
