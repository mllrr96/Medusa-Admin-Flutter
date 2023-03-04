import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_update_user_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

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
    await loadUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    super.onClose();
  }

  Future<void> loadUser() async {
    change(null, status: RxStatus.loading());
    final authResponse = await authRepo.getSession();

    if (authResponse != null && authResponse.user != null) {
      _id = authResponse.user!.id!;
      final result = await userRepo.retrieve(id: authResponse.user!.id!);
      result.when((success) {
        if (success.user != null) {
          change(success.user!, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error('Error loading user'));
        }
      }, (error) => change(null, status: RxStatus.error(error.getMessage())));
    } else {
      change(null, status: RxStatus.error('Error loading user'));
    }
  }

  Future<void> updateUser() async {
    loading();
    final result = await userRepo.update(
        id: _id, userUpdateUserReq: UserUpdateUserReq(firstName: firstNameCtrl.text, lastName: lastNameCtrl.text));
    result.when((success) async {
      EasyLoading.showSuccess('Updated');
      await loadUser();
    }, (error) => EasyLoading.showError(error.getMessage()));
  }
}
