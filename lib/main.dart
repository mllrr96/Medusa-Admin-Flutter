import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/initial_binding.dart';

import 'app/data/service/storage_service.dart';
import 'app/data/service/theme_service.dart';
import 'app/routes/app_pages.dart';
import 'core/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeService>(
      assignId: true,
      builder: (themeCtrl) {
        return GetMaterialApp(
          title: "Medusa Admin",
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBinding(),
          themeMode: themeCtrl.themeMode,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

Future<void> initServices() async {
  debugPrint('starting services ...');
  await Get.putAsync(() => StorageService().init());
  Get.put(ThemeService());
  debugPrint('All services started...');
}
