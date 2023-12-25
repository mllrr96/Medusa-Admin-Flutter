import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:medusa_admin/app/modules/settings_module/store_settings/sales_channel_module/sales_channels/components/index.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../../data/repository/sales_channel/sales_channel_repo.dart';
import '../controllers/sales_channels_controller.dart';

@RoutePage()
class SalesChannelsView extends StatelessWidget {
  const SalesChannelsView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return GetBuilder<SalesChannelsController>(
        init: SalesChannelsController(salesChannelRepo: SalesChannelRepo()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
              title: const Text('Sales Channels'),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight / 2),
                  child: Container(
                    height: kToolbarHeight / 2,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                    'Control which products are available in which channels',
                                    style: smallTextStyle?.copyWith(
                                        color: lightWhite)))),
                        const Divider(height: 0),
                      ],
                    ),
                  )),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  // final result =
                  //     await Get.toNamed(Routes.ADD_UPDATE_SALES_CHANNEL);
                  final result = await context.pushRoute(AddUpdateSalesChannelRoute());
                  if (result is bool) {
                    controller.pagingController.refresh();
                  }
                },
                child: const Icon(CupertinoIcons.add)),
            body: SafeArea(
                child: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () => controller.pagingController.refresh(),
              header: GetPlatform.isIOS
                  ? const ClassicHeader(completeText: '')
                  : const MaterialClassicHeader(),
              child: PagedListView.separated(
                separatorBuilder: (_, __) =>
                    const Divider(height: 0, indent: 16.0),
                padding: const EdgeInsets.only(bottom: kToolbarHeight),
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<SalesChannel>(
                  itemBuilder: (context, salesChannel, index) => SalesChannelTile(salesChannel),
                  firstPageProgressIndicatorBuilder: (_) =>
                      const SalesChannelsLoadingPage(),
                  firstPageErrorIndicatorBuilder: (_) => PaginationErrorPage(pagingController: controller.pagingController)
                ),
              ),
            )),
          );
        });
  }
}
