import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';

import '../../../../data/models/store/customer_group.dart';

class CreateUpdateGroupController extends GetxController {
  CreateUpdateGroupController(
      {required this.customerGroupRepo, required this.customerGroup});
  final CustomerGroup? customerGroup;
  final groupTitleCtrl = TextEditingController();
  final CustomerGroupRepo customerGroupRepo;
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
    final result = await customerGroupRepo.updateCustomerGroup(
        id: customerGroup!.id!, name: groupTitleCtrl.text, metadata: metadata);
    result.when((success) {
      context.popRoute(success.customerGroup);
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
    final result = await customerGroupRepo.createCustomerGroup(
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
