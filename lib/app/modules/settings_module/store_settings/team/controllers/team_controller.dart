import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';

class TeamController extends GetxController with StateMixin<List<User>> {
  TeamController({required this.userRepo});
  final UserRepo userRepo;
  RxBool search = false.obs;
  RxInt membersCount = 0.obs;
  @override
  Future<void> onInit() async {
    await loadUser();
    super.onInit();
  }


  Future<void> loadUser() async {
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
}
