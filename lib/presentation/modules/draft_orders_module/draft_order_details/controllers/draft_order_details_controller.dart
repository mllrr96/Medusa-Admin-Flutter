import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/draft_details_use_case.dart';
import 'package:medusa_admin/presentation/modules/draft_orders_module/draft_orders/controllers/draft_orders_controller.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';

class DraftOrderDetailsController extends GetxController with StateMixin<DraftOrder> {
  DraftOrderDetailsController( {required this.draftDetailsUseCase, required this.draftId,});

  final DraftDetailsUseCase draftDetailsUseCase;
  final scrollController = ScrollController();
  final summeryKey = GlobalKey();
  final paymentKey = GlobalKey();
  final shippingKey = GlobalKey();
  final customerKey = GlobalKey();
  final String draftId;

  @override
  Future<void> onInit() async {
    await loadDraftOrder();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> loadDraftOrder() async {
    change(null, status: RxStatus.loading());
    final result = await draftDetailsUseCase.retrieveDraftOrder(
      id: draftId,
      queryParameters: {
        'expand': 'order,cart',
      },
    );
    result.when((draftOrder) {
      change(draftOrder, status: RxStatus.success());

    }, (error) => change(null, status: RxStatus.error(error.message)));
  }

  Future<void> markAsPaid(BuildContext context) async {
    loading();
    final result = await draftDetailsUseCase.registerPayment(id: draftId);
    result.when((success) async {
      context.showSnackBar('Successfully marked as paid');
      await loadDraftOrder();
      DraftOrdersController.instance.pagingController.refresh();
    }, (error) {
      context.showSnackBar('Error marking as paid ${error.code ?? ''}');
    });
    dismissLoading();
  }

  Future<void> cancelDraftOrder(BuildContext context)async{
    loading();
    final result = await draftDetailsUseCase.cancelDraft(id: draftId);
    result.when((success) {
      dismissLoading();
      context.showSnackBar('Draft Order Canceled');
      context.popRoute();
    }, (error){
      dismissLoading();
      context.showSnackBar('Error canceling draft order, ${error.toSnackBarString()}');
    });

  }
}
