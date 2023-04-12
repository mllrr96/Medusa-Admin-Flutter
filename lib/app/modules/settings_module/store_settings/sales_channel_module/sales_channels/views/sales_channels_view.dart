import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controllers/sales_channels_controller.dart';

class SalesChannelsView extends GetView<SalesChannelsController> {
  const SalesChannelsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Sales Channels'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight / 2),
            child: Container(
              height: kToolbarHeight / 2,
              alignment: Alignment.center,
              // color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text('Control which products are available in which channels',
                              style: smallTextStyle?.copyWith(color: lightWhite)))),
                  const Divider(height: 0),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Get.toNamed(Routes.ADD_UPDATE_SALES_CHANNEL);
            if (result is bool) {
              controller.pagingController.refresh();
            }
          },
          child: const Icon(CupertinoIcons.add)),
      body: SafeArea(
          child: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () => controller.pagingController.refresh(),
        header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
        child: PagedListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 0),
          padding: const EdgeInsets.only(bottom: kToolbarHeight),
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<SalesChannel>(
            itemBuilder: (context, salesChannel, index) => ListTile(
              onTap: () => Get.toNamed(Routes.SALES_CHANNEL_DETAILS, arguments: salesChannel),
              tileColor: Theme.of(context).appBarTheme.backgroundColor,
              title: Text(salesChannel.name ?? '', style: largeTextStyle),
              subtitle: Text(salesChannel.description ?? '', style: smallTextStyle?.copyWith(color: lightWhite)),
              trailing: salesChannel.isDisabled != null && salesChannel.isDisabled == false
                  ? null
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                          color: Theme.of(context).scaffoldBackgroundColor),
                      child: Text('Draft', style: mediumTextStyle)),
            ),
            firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator.adaptive()),
          ),
        ),
      )),
    );
  }
}
