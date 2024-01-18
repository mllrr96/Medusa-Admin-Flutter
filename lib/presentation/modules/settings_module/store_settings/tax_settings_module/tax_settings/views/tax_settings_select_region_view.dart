import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/domain/use_case/tax_settings_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../../regions_module/regions/components/region_card.dart';
import '../controllers/tax_settings_select_region_controller.dart';

@RoutePage()
class TaxSettingsSelectRegionView extends StatelessWidget {
  const TaxSettingsSelectRegionView({super.key});

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return GetBuilder<TaxSettingsSelectRegionController>(
        init: TaxSettingsSelectRegionController(taxSettingsUseCase: TaxSettingsUseCase.instance),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Regions'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight / 2),
                child: Container(
                  color: context.theme.scaffoldBackgroundColor,
                  height: kToolbarHeight / 2,
                  padding: const EdgeInsets.only(left: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select the region you wish to manage taxes for',
                    style: smallTextStyle?.copyWith(color: manatee),
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () => controller.pagingController.refresh(),
                header: const MaterialClassicHeader(),
                child: PagedListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Region>(
                    itemBuilder: (context, region, index) => RegionCard(
                      region: region,
                      onTap: () =>
                          context.pushRoute(TaxSettingsRoute(region: region)),
                      showProviders: false,
                    ),
                    firstPageErrorIndicatorBuilder: (_) => PaginationErrorPage(
                        pagingController: controller.pagingController),
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
