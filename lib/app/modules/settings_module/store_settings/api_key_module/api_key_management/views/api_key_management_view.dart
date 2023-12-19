import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/publishable_api_key/publishable_api_key_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../data/models/store/publishable_api_key.dart';
import '../controllers/api_key_management_controller.dart';

@RoutePage()
class ApiKeyManagementView extends StatelessWidget {
  const ApiKeyManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return GetBuilder<ApiKeyManagementController>(
        init: ApiKeyManagementController(apiKeyRepo: PublishableApiKeyRepo()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
              title: const Text('Api Key Management'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Get.toNamed(Routes.ADD_UPDATE_API_KEY),
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
                    itemBuilder: (context, apiKey, index) {
                      final revoked = apiKey.revokedAt != null;
                      return Container(
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 12.0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 4,
                                    decoration: BoxDecoration(
                                        color: revoked
                                            ? Colors.redAccent
                                            : Colors.green,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(12))),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(apiKey.title ?? ''),
                                        Text(apiKey.id ?? '',
                                            style: smallTextStyle?.copyWith(
                                                color: lightWhite)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(apiKey.createdAt.formatDate(),
                                    style: smallTextStyle),
                                Text(apiKey.createdAt.formatTime(),
                                    style: smallTextStyle),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    noItemsFoundIndicatorBuilder: (_) =>
                        const Center(child: Text('No orders yet!')),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                            child: CircularProgressIndicator.adaptive()),
                  ),
                  separatorBuilder: (_, __) => const Divider(height: 1),
                ),
              ),
            ),
          );
        });
  }
}
