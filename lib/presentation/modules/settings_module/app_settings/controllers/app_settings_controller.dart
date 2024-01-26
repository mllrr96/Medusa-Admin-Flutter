import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medusa_admin/core/di/di.dart';

class AppSettingsController extends GetxController {
  bool? canCheckBiometrics;
  LocalAuthentication localAuthentication = getIt<LocalAuthentication>();

  @override
  Future<void> onReady() async {
    canCheckBiometrics = await localAuthentication.canCheckBiometrics || await localAuthentication.isDeviceSupported();
    update();
    super.onReady();
  }
}
