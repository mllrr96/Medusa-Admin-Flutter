import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../components/scrolling_expandable_fab.dart';
import '../components/region_card.dart';
import '../controllers/regions_controller.dart';

@RoutePage()
class RegionsView extends StatelessWidget {
  const RegionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegionsController>(
        init: RegionsController(regionsRepo: RegionsRepo()),
        builder: (controller) {
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
            final result = await context.pushRoute(const AddRegionRoute());
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
              header: GetPlatform.isIOS
                  ? const ClassicHeader(completeText: '')
                  : const MaterialClassicHeader(),
              child: PagedListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 6.0),
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Region>(
                    itemBuilder: (context, region, index) =>
                        RegionCard(region: region),
                    firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive())),
              ),
            )),
      );
    });
  }
}
