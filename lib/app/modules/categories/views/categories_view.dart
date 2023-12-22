import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/product_category.dart';
import 'package:medusa_admin/app/data/repository/product_category/product_category_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/categories_controller.dart';

@RoutePage()
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
        init: CategoriesController(categoryRepo: ProductCategoryRepo()),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () => controller.pagingController.refresh(),
                header: GetPlatform.isIOS
                    ? const ClassicHeader(completeText: '')
                    : const MaterialClassicHeader(),
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
                  ),
                ),
              ),
            ),
          );
        });
  }
}
