import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../components/adaptive_back_button.dart';
import '../controllers/return_reasons_controller.dart';

class ReturnReasonsView extends GetView<ReturnReasonsController> {
  const ReturnReasonsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Return Reasons'),
        actions: [
          AdaptiveIcon(
              onPressed: () async => await Get.toNamed(Routes.CREATE_UPDATE_RETURN_REASON)?.then((value) {
                    if (value != null && value == true) {
                      controller.pagingController.refresh();
                    }
                  }),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
          child: PagedListView(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<ReturnReason>(
                itemBuilder: (context, returnReason, index) => ReturnReasonCard(returnReason: returnReason),
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive())),
          ),
        ),
      ),
    );
  }
}

class ReturnReasonCard extends GetView<ReturnReasonsController> {
  const ReturnReasonCard({
    super.key,
    required this.returnReason,
    this.onPressed,
  });

  final ReturnReason returnReason;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    return GestureDetector(
      onTap: onPressed ??
          () => Get.toNamed(Routes.CREATE_UPDATE_RETURN_REASON, arguments: returnReason)?.then((value) {
                if (value != null && value == true) {
                  controller.pagingController.refresh();
                }
              }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    returnReason.label!,
                    style: largeTextStyle,
                  ),
                  if (returnReason.description != null)
                    Text(returnReason.description!, style: mediumTextStyle!.copyWith(color: lightWhite))
                ],
              ),
            ),
            AdaptiveIcon(
                onPressed: () async {
                  await showOkCancelAlertDialog(
                          context: context,
                          title: 'Delete Return Reason',
                          message: 'Are you sure you want to delete this return reason?',
                          isDestructiveAction: true,
                          okLabel: 'Yes, Delete',
                          cancelLabel: 'No, Cancel')
                      .then((value) async {
                    if (value == OkCancelResult.ok) {
                      await controller.deleteReturnReason(returnReason.id!);
                    }
                  });
                },
                icon: const Icon(Icons.delete_forever, color: Colors.redAccent))
          ],
        ),
      ),
    );
  }
}
