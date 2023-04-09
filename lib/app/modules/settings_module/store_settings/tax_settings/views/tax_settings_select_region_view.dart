import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../data/models/store/region.dart';
import '../../regions_module/regions/views/regions_view.dart';
import '../controllers/tax_settings_select_region_controller.dart';

class TaxSettingsSelectRegionView extends GetView<TaxSettingsSelectRegionController> {
  const TaxSettingsSelectRegionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Regions'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight / 2),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: kToolbarHeight / 2,
            padding: const EdgeInsets.only(left: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Select the region you wish to manage taxes for',
              style: smallTextStyle?.copyWith(color: lightWhite),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
          child: PagedListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: 6.0),
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Region>(
              itemBuilder: (context, region, index) => RegionCard(
                region: region,
                onTap: () => Get.toNamed(Routes.TAX_SETTINGS, arguments: region),
                showProviders: false,
              ),
              firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        ),
      ),
    );
  }
}
