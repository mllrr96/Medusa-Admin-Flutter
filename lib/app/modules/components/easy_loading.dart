import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medusa_admin/core/utils/colors.dart';

Future<void> loading({String? status}) async {
  await EasyLoading.show(
      // status: status ?? 'Loading',
      maskType: EasyLoadingMaskType.black,
      indicator: LoadingAnimationWidget.threeArchedCircle(color: ColorManager.primary, size: 50));
}

Future<void> dismissLoading() async {
  await EasyLoading.dismiss();
}
