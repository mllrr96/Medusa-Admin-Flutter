import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/api_key_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../components/api_key_tile.dart';
import '../controllers/api_key_management_controller.dart';

@RoutePage()
class ApiKeyManagementView extends StatelessWidget {
  const ApiKeyManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiKeyManagementController>(
        init: ApiKeyManagementController(apiKeyUseCase: ApiKeyUseCase.instance),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Api Key Management'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.pushRoute(AddUpdateApiKeyRoute()),
              child: const Icon(CupertinoIcons.add),
            ),
            body: SafeArea(
              child: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () => controller.pagingController.refresh(),
                header: const MaterialClassicHeader(),
                child: PagedListView.separated(
                  padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<PublishableApiKey>(
                    itemBuilder: (context, apiKey, index) => ApiKeyTile(apiKey),
                    noItemsFoundIndicatorBuilder: (_) =>
                        const Center(child: Text('No items found')),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                            child: CircularProgressIndicator.adaptive()),
                    firstPageErrorIndicatorBuilder: (_) => PaginationErrorPage(
                        pagingController: controller.pagingController),
                  ),
                  separatorBuilder: (_, __) => const Divider(height: 1),
                ),
              ),
            ),
          );
        });
  }
}
