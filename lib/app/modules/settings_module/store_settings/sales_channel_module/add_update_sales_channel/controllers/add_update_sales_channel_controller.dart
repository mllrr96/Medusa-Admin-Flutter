import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/sales_channel/sales_channel_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';
import '../../../../../../data/models/req/user_sales_channel_req.dart';

class AddUpdateSalesChannelController extends GetxController {
  AddUpdateSalesChannelController(
      {required this.salesChannelRepo, required this.salesChannel});
  final SalesChannelRepo salesChannelRepo;

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
    final result = await salesChannelRepo.update(
        id: salesChannel!.id!,
        userSalesChannelUpdateRes: UserSalesChannelUpdateReq(
          name: titleCtrl.text,
          description: descriptionCtrl.text,
          isDisabled: disabled,
        ));
    result.when((success) {
      context.popRoute(success.salesChannel);
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
    final result = await salesChannelRepo.create(
        userSalesChannelCreateReq: UserSalesChannelCreateReq(
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
