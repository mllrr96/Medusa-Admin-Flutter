import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medusa_admin/data/service/storage_service.dart';
import 'package:medusa_admin/data/service/store_service.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/use_case/auth_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/modules/activity_module/activity_controller.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    load();
    super.initState();
  }

  Future load() async {
    if (StorageService.baseUrl == null) {
      context.router.replaceAll([SignInRoute()]);
      return;
    }

    if (StorageService.baseUrl != null &&
        !getIt.isRegistered<MedusaAdmin>()) {
      getIt.registerLazySingleton<MedusaAdmin>(() => MedusaAdmin.initialize(
            prefs: getIt<SharedPreferences>(),
            config: MedusaConfig(
              baseUrl: StorageService.baseUrl!,
              enableDebugging: false,
            ),
          ));
    }

    String? cookie = StorageService.instance.cookie;
    if (cookie == null) {
      context.router.replaceAll([SignInRoute()]);
      return;
    }

    final result = await AuthenticationUseCase.instance.getSession();

    result.when((user) async {
      await Get.putAsync(() =>
          StoreService(storeRepo: getIt<MedusaAdmin>().storeRepository)
              .init()).then((value) {
        Get.put(ActivityController());
        context.router.replaceAll([const DashboardRoute()]);
      });
    }, (error) async {
      if (error.code == 401 || error.code == 404) {
        await StorageService.instance.clearCookie().then((_) {
          context.router.replaceAll([SignInRoute()]);
        });
      } else {
        context.router.replaceAll([SignInRoute()]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.systemUiOverlayNoAppBarStyle,
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: context.theme.scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                  tag: 'medusa',
                  child: Image.asset('assets/images/medusa.png', scale: 5)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text('Medusa Admin', style: context.headlineLarge),
              ),
              const SizedBox(height: 15),
              LoadingAnimationWidget.staggeredDotsWave(
                  color: context.theme.primaryColor, size: 40),
            ],
          ),
        ),
      ),
    );
  }
}
