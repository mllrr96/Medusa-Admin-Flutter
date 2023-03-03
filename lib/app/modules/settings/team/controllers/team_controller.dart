import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';

class TeamController extends GetxController with StateMixin<List<User>> {
  TeamController({required this.userRepo});
  final UserRepo userRepo;
  RxBool search = false.obs;

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
    super.onClose();
  }

  Future<void> loadUser() async {
    change(null, status: RxStatus.loading());
    final result = await userRepo.retrieveAll();
    result.fold((l) {
      if (l.userList != null) {
        change(l.userList, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error());
      }
    }, (r) {
      change(null, status: RxStatus.error(r.getMessage()));
    });
  }
}
