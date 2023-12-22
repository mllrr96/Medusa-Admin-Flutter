import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/invite/invite_repo.dart';

import '../../../../../../core/utils/enums.dart';
import '../../../../components/easy_loading.dart';

class InviteController extends GetxController with StateMixin<List<Invite>> {
  InviteController({required this.inviteRepo});
static InviteController get instance => Get.find<InviteController>();
  final InviteRepo inviteRepo;
  RxString searchTerm = ''.obs;
  @override
  Future<void> onInit() async {
    await loadInvites();
    super.onInit();
  }

  Future<void> loadInvites() async {
    change(null, status: RxStatus.loading());
    final result = await inviteRepo.retrieveInvites();
    result.when((success) {
      if (success.invites == null || success.invites!.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(success.invites!, status: RxStatus.success());
      }
    }, (error) => change(null, status: RxStatus.error(error.message)));
  }

  Future<void> inviteUser({required String email, required UserRole role, required BuildContext context}) async {
    loading();
    final result = await inviteRepo.createInvitation(email: email, role: role);
    result.when((success) async {
      EasyLoading.showSuccess('Invite sent');
      context.popRoute();
      await loadInvites();
    }, (error) => EasyLoading.showError('Error sending invite'));
  }

  Future<void> resendInvite(String inviteId) async {
    loading();
    final result = await inviteRepo.resendInvite(inviteId: inviteId);
    result.when((success) {
      EasyLoading.showSuccess('Invite resent');
    }, (error) => EasyLoading.showError('Error resending invite'));
  }

  Future<void> deleteInvite(String inviteId) async {
    loading();
    final result = await inviteRepo.deleteInvite(inviteId: inviteId);
    result.when((success) async {
      EasyLoading.showSuccess('Invite removed');
      await loadInvites();
    }, (error) => EasyLoading.showError('Error removing invite'));
  }
}
