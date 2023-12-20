import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';

import '../../../../data/repository/regions/regions_repo.dart';
import '../controllers/pick_regions_controller.dart';

class PickRegionsView extends StatelessWidget {
  const PickRegionsView({super.key, this.pickRegionsReq});
  final PickRegionsReq? pickRegionsReq;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickRegionsController>(
      init: PickRegionsController(regionsRepo: RegionsRepo(), pickRegionsReq: pickRegionsReq),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveCloseButton(),
            title: controller.regionsReq.multipleSelect ? const Text('Pick Regions') : const Text('Pick Region'),
            actions: [
              AdaptiveButton(
                  onPressed: controller.selectedRegions.isNotEmpty
                      ? () => context.popRoute(PickRegionsRes(regions: controller.selectedRegions))
                      : null,
                  child: const Text('Done'))
            ],
          ),
          body: SafeArea(
            child: PagedListView.separated(
              separatorBuilder: (_, __) => const Divider(height: 0, indent: 16),
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Region>(
                itemBuilder: (context, region, index) => CheckboxListTile(
                    title: Text(region.name ?? ''),
                    value: controller.selectedRegions.map((e) => e.id).toList().contains(region.id),
                    onChanged: (val) {
                      if (!controller.regionsReq.multipleSelect) {
                        controller.selectedRegions = [region];
                        controller.update();
                        return;
                      }
                      if (val != null && val) {
                        controller.selectedRegions.add(region);
                      } else {
                        controller.selectedRegions.removeWhere((element) => element.id == region.id);
                      }
                      controller.update();
                    }),
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
              ),
            ),
          ),
        );
      },
    );
  }
}
