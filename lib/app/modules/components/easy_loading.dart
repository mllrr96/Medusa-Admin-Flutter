import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> loading ()async{
  await EasyLoading.show(status: 'Loading', maskType: EasyLoadingMaskType.black);
}


Future<void> dismissLoading ()async{
  await EasyLoading.dismiss();
}

