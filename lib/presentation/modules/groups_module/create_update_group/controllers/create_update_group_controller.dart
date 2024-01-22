import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/domain/use_case/group/update_group_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
class CreateUpdateGroupController extends GetxController {
  CreateUpdateGroupController(
      {required this.updateGroupUseCase, required this.customerGroup});
  final CustomerGroup? customerGroup;
  final groupTitleCtrl = TextEditingController();
  final UpdateGroupUseCase updateGroupUseCase;
  final formKey = GlobalKey<FormState>();
  bool get updateMode => customerGroup != null;
  final scrollController = ScrollController();
  var metadata = <Metadata>[];
  var metadataTextCtrl = <MetadataTextCtrl>[];
  final listKey = GlobalKey<AnimatedListState>();
  @override
  Future<void> onInit() async {
    if (customerGroup != null) {
      await _fetchCustomerGroup();
    }
    super.onInit();
  }

  @override
  void onClose() {
    groupTitleCtrl.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _fetchCustomerGroup() async {
    groupTitleCtrl.text = customerGroup?.name ?? '';
    customerGroup?.metadata?.forEach((key, value) {
      metadataTextCtrl.add(MetadataTextCtrl(
          key: TextEditingController(text: key),
          value: TextEditingController(text: value)));
      update();
    });
  }

  Future<void> updateCustomerGroup(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    context.unfocus();
    loading();
    var metadata = <String, dynamic>{};
    for (var e in metadataTextCtrl) {
      metadata.addAll({e.key.text: e.value.text});
    }
    final result = await updateGroupUseCase.updateCustomerGroup(
        id: customerGroup!.id!, name: groupTitleCtrl.text, metadata: metadata);
    result.when((customerGroup) {
      context.popRoute(customerGroup);
      EasyLoading.showSuccess('Customer group updated!');
    }, (error) {
      dismissLoading();
      context.showSnackBar(error.toSnackBarString());
    });
  }

  Future<void> createCustomerGroup(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    context.unfocus();
    loading();
    var metadata = <String, dynamic>{};
    for (var e in metadataTextCtrl) {
      metadata.addAll({e.key.text: e.value.text});
    }
    final result = await updateGroupUseCase.createCustomerGroup(
        name: groupTitleCtrl.text,
        metadata: metadata.isNotEmpty ? metadata : null);
    result.when((success) {
      context.showSnackBar('Customer group created!');
      context.popRoute(true);
    }, (error) {
      context.showSnackBar(
          'Error creating customer group, ${error.toSnackBarString()}');
    });
    dismissLoading();
  }
}

class Metadata {
  final String key;
  final dynamic value;
  Metadata({required this.key, this.value});
}

class MetadataTextCtrl {
  final TextEditingController key;
  final TextEditingController value;
  MetadataTextCtrl({required this.key, required this.value});
}
