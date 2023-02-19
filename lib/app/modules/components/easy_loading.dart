import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> loading ({String? status})async{
  await EasyLoading.show(status: status ?? 'Loading', maskType: EasyLoadingMaskType.black);
}


Future<void> dismissLoading ()async{
  await EasyLoading.dismiss();
}

