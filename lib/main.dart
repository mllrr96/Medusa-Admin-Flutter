import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/dio_service.dart';

import 'app/routes/app_pages.dart';
import 'core/theme/theme.dart';

Future<void> main() async {
  await initServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Medusa Admin",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

Future<void> initServices() async {
  debugPrint('starting services ...');
  await Get.putAsync(() => DioService().init());

  // Get.put(ThemeService());
  debugPrint('All services started...');
}
