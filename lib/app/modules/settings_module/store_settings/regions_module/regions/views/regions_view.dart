import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../components/scrolling_expandable_fab.dart';
import '../components/region_card.dart';
import '../controllers/regions_controller.dart';

class RegionsView extends GetView<RegionsController> {
  const RegionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Regions'),
      ),
      floatingActionButton: ScrollingExpandableFab(
        controller: controller.scrollController,
        label: 'New Region',
        icon: const Icon(Icons.add),
        onPressed: () async {
          final result = await Get.toNamed(Routes.ADD_REGION);
          if (result is bool && result == true) {
            controller.pagingController.refresh();
          }
        },
      ),
      body: SafeArea(
          child: SmartRefresher(
        scrollController: controller.scrollController,
        controller: controller.refreshController,
        onRefresh: () => controller.pagingController.refresh(),
        header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
        child: PagedListView.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 6.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Region>(
              itemBuilder: (context, region, index) => RegionCard(region: region),
              firstPageProgressIndicatorBuilder: (context) =>
                  const Center(child: CircularProgressIndicator.adaptive())),
        ),
      )),
    );
  }
}

