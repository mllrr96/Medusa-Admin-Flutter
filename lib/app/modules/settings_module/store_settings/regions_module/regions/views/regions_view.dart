import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/regions_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../components/scrolling_expandable_fab.dart';
import '../components/region_card.dart';
import '../components/regions_loading_page.dart';
import '../controllers/regions_controller.dart';

@RoutePage()
class RegionsView extends StatelessWidget {
  const RegionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegionsController>(
        init: RegionsController(RegionsUseCase.instance),
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
                final result = await context.pushRoute(AddRegionRoute());
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
                separatorBuilder: (_, __) => const Gap(6.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Region>(
                  itemBuilder: (context, region, index) =>
                      RegionCard(region: region),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const RegionsLoadingPage(),
                  firstPageErrorIndicatorBuilder: (context) =>
                      PaginationErrorPage(
                          pagingController: controller.pagingController),
                ),
              ),
            )),
          );
        });
  }
}
