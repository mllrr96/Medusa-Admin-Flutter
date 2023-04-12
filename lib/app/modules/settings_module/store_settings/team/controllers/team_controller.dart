import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';
import '../../../../../data/models/req/user_user_req.dart';
import '../../../../components/easy_loading.dart';

class TeamController extends GetxController with StateMixin<List<User>> {
  TeamController({required this.userRepo});
  static TeamController get instance => Get.find<TeamController>();
  final UserRepo userRepo;
  RxBool search = false.obs;
  final searchCtrl = TextEditingController();
  RxInt membersCount = 0.obs;
  RxString searchTerm = ''.obs;
  @override
  Future<void> onInit() async {
    await loadUsers();
    super.onInit();
  }

  @override
  void onClose() {
    searchCtrl.dispose();
    super.onClose();
  }

  Future<void> loadUsers() async {
    change(null, status: RxStatus.loading());
    final result = await userRepo.retrieveAll();
    result.when((success) {
      if (success.userList != null) {
        membersCount.value = success.userList!.length;
        change(success.userList!, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error());
      }
    }, (error) => change(null, status: RxStatus.error(error.message)));
  }

  Future<void> updateUser({required String id, required UserUpdateUserReq userUpdateUserReq}) async {
    loading();
    final result = await userRepo.update(id: id, userUpdateUserReq: userUpdateUserReq);
    result.when((success) async {
      EasyLoading.showSuccess('User updated');
      Get.back();
      await loadUsers();
    }, (error) => EasyLoading.showError('Error updating user'));
  }

  Future<void> deleteUser(String id) async {
    loading();
    final result = await userRepo.delete(id: id);
    result.when((success) async {
      EasyLoading.showSuccess('User deleted');
      await loadUsers();
    }, (error) => EasyLoading.showError('Error deleting user'));
  }
}
