import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'activity_controller.dart';
import 'widgets/batch_job_tile.dart';

@RoutePage()
class ActivityView extends GetView<ActivityController> {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: context.defaultSystemUiOverlayStyle,
        title: const Text('Activity'),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () => controller.pagingController.refresh(),
        child: PagedListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 0),
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<BatchJob>(
            itemBuilder: (context, batchJob, index) => BatchJobTile(
              batchJob,
              onDelete: () {},
              onShare: () async => controller.shareFile(
                  batchJob.result?.fileKey ?? '',
                  batchJob.result?.fileKey?.split('\\').last ?? ''),
            ),
          ),
        ),
      ),
    );
  }
}
