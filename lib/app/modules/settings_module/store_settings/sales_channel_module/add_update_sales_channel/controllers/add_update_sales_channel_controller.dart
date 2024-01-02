import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/update_sales_channel_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';

class AddUpdateSalesChannelController extends GetxController {
  AddUpdateSalesChannelController(
      {required this.updateSalesChannelUseCase, required this.salesChannel});
  final UpdateSalesChannelUseCase updateSalesChannelUseCase;

  final SalesChannel? salesChannel;
  bool get updateMode => salesChannel == null ? false : true;
  bool disabled = false;
  final formKey = GlobalKey<FormState>();
  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  @override
  void onInit() {
    if (updateMode) {
      titleCtrl.text = salesChannel!.name ?? '';
      descriptionCtrl.text = salesChannel!.description ?? '';
      disabled = salesChannel!.isDisabled ?? false;
    }
    super.onInit();
  }

  @override
  void onClose() {
    titleCtrl.dispose();
    descriptionCtrl.dispose();
    super.onClose();
  }

  Future<void> updateChannel(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (disabled == (salesChannel!.isDisabled ?? false) &&
        titleCtrl.text == salesChannel!.name &&
        descriptionCtrl.text == salesChannel!.description) {
      context.popRoute();
      return;
    }
    loading();
    final result = await updateSalesChannelUseCase.update(
        id: salesChannel!.id!,
        userSalesChannelUpdateReq: UserSalesChannelUpdateReq(
          name: titleCtrl.text,
          description: descriptionCtrl.text,
          isDisabled: disabled,
        ));
    result.when((salesChannel) {
      context.popRoute(salesChannel);
    },
        (error) => context.showSnackBar(
            'Error updating sales channel, ${error.toSnackBarString()}'));
    dismissLoading();
  }

  Future<void> createChannel(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    loading();
    final result =
        await updateSalesChannelUseCase.create(UserSalesChannelCreateReq(
      name: titleCtrl.text,
      description: descriptionCtrl.text,
      isDisabled: disabled,
    ));
    result.when((success) {
      context.popRoute(true);
    }, (error) => context.showSnackBar(error.toSnackBarString()));
    dismissLoading();
  }
}
