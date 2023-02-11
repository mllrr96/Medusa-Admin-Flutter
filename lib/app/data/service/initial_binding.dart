import 'package:get/instance_manager.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';

class InitialBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    //TODO: Store Service should be initialized after successfully checking the user is logged in
    await Get.putAsync(() => StoreService(storeRepo: StoreRepo()).init(), permanent: true);
  }
}
