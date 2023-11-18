import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../../data/models/req/user_user_req.dart';

class PersonalInformationController extends GetxController with StateMixin<User> {
  PersonalInformationController({required this.userRepo, required this.authRepo});
  final UserRepo userRepo;
  final AuthRepo authRepo;
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
    final authResponse = await authRepo.getSession();

    authResponse.when((success) async {
      _id = success.user!.id!;
      final result = await userRepo.retrieve(id: success.user!.id!.toString());
      result.when((success) {
        if (success.user != null) {
          change(success.user!, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error('Error loading user'));
        }
      }, (error) => change(null, status: RxStatus.error(error.message)));
    }, (error) {
      change(null, status: RxStatus.error('Error loading user'));
    });
  }

  Future<void> updateUser() async {
    loading();
    final result = await userRepo.update(
        id: _id, userUpdateUserReq: UserUpdateUserReq(firstName: firstNameCtrl.text, lastName: lastNameCtrl.text));
    result.when((success) async {
      EasyLoading.showSuccess('Updated');
      await fetchUser();
    }, (error) => EasyLoading.showError(error.message));
  }
}
