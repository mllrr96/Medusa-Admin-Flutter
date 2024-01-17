import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/categories_use_case.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/categories_controller.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
        init: CategoriesController(categoriesUseCase: CategoriesUseCase.instance),
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
