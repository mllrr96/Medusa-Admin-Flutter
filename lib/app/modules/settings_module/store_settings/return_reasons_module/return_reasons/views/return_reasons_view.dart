import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/return_reasons_use_case.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../../../../components/adaptive_back_button.dart';
import '../components/return_reason_list_tile.dart';
import '../controllers/return_reasons_controller.dart';

@RoutePage()
class ReturnReasonsView extends GetView<ReturnReasonsController> {
  const ReturnReasonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReturnReasonsController>(
        init: ReturnReasonsController(returnReasonsUseCase: ReturnReasonsUseCase.instance),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
              title: const Text('Return Reasons'),
              // actions: [
              //   AdaptiveIcon(
              //       onPressed: () async =>
              //           await context.pushRoute(CreateUpdateReturnReasonRoute()).then((
              //           value) {
              //         if (value != null && value == true) {
              //           controller.pagingController.refresh();
              //         }
              //       }),
              //       icon: const Icon(Icons.add))
              // ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async => await context
                  .pushRoute(CreateUpdateReturnReasonRoute())
                  .then((value) {
                if (value != null && value == true) {
                  controller.pagingController.refresh();
                }
              }),
              label: const Text('Add Return Reason'),
              icon: const Icon(Icons.add),
            ),
            body: SafeArea(
              child: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () => controller.pagingController.refresh(),
                header: GetPlatform.isIOS
                    ? const ClassicHeader(completeText: '')
                    : const MaterialClassicHeader(),
                child: SlidableAutoCloseBehavior(
                  child: PagedListView.separated(
                    separatorBuilder: (_, __) => const Divider(height: 0),
                    pagingController: controller.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<ReturnReason>(
                        itemBuilder: (context, returnReason, index) =>
                            ReturnReasonCard(returnReason, listTiltStyle: true),
                        firstPageProgressIndicatorBuilder: (_) => const Center(
                            child: CircularProgressIndicator.adaptive())),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
