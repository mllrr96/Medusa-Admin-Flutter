import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/publishable_api_key/publishable_api_key_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../data/models/store/publishable_api_key.dart';
import '../components/api_key_tile.dart';
import '../controllers/api_key_management_controller.dart';

@RoutePage()
class ApiKeyManagementView extends StatelessWidget {
  const ApiKeyManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiKeyManagementController>(
        init: ApiKeyManagementController(apiKeyRepo: PublishableApiKeyRepo()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
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
                header: GetPlatform.isIOS
                    ? const ClassicHeader(completeText: '')
                    : const MaterialClassicHeader(),
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
