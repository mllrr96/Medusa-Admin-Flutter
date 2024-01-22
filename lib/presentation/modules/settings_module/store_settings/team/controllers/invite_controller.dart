import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/team/team_use_case.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';


class InviteController extends GetxController with StateMixin<List<Invite>> {
  InviteController({required this.teamUseCase});
static InviteController get instance => Get.find<InviteController>();
  final TeamUseCase teamUseCase;
  RxString searchTerm = ''.obs;
  @override
  Future<void> onInit() async {
    await loadInvites();
    super.onInit();
  }

  Future<void> loadInvites() async {
    change(null, status: RxStatus.loading());
    final result = await teamUseCase.fetchInvites();
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
    final result = await teamUseCase.inviteUser(email: email, role: role);
    result.when((success) async {
      EasyLoading.showSuccess('Invite sent');
      context.popRoute();
      await loadInvites();
    }, (error) => EasyLoading.showError('Error sending invite'));
  }

  Future<void> resendInvite(String inviteId) async {
    loading();
    final result = await teamUseCase.resendInvite(inviteId);
    result.when((success) {
      EasyLoading.showSuccess('Invite resent');
    }, (error) => EasyLoading.showError('Error resending invite'));
  }

  Future<void> deleteInvite(String inviteId) async {
    loading();
    final result = await teamUseCase.deleteInvite(inviteId);
    result.when((success) async {
      EasyLoading.showSuccess('Invite removed');
      await loadInvites();
    }, (error) => EasyLoading.showError('Error removing invite'));
  }
}
