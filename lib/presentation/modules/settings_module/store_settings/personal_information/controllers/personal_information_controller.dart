import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/personal_info/personal_info_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';

class PersonalInformationController extends GetxController
    with StateMixin<User> {
  PersonalInformationController(this.personalInfoUseCase);
  final PersonalInfoUseCase personalInfoUseCase;
  final formKey = GlobalKey<FormState>();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  late String _id;
  @override
  Future<void> onInit() async {
    await fetchUser();
    super.onInit();
  }

  @override
  void onClose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    super.onClose();
  }

  Future<void> fetchUser() async {
    change(null, status: RxStatus.loading());
    final authResponse = await personalInfoUseCase.currentUser();

    authResponse.when((user) async {
      _id = user.id!;
      change(user, status: RxStatus.success());
    }, (error) => change(null, status: RxStatus.error(error.message)));
  }

  Future<void> updateUser() async {
    loading();
    final result = await personalInfoUseCase.updateUser(
        id: _id,
        userUpdateUserReq: UserUpdateUserReq(
            firstName: firstNameCtrl.text, lastName: lastNameCtrl.text));
    result.when((success) async {
      EasyLoading.showSuccess('Updated');
      await fetchUser();
    }, (error) => EasyLoading.showError(error.message));
  }
}
