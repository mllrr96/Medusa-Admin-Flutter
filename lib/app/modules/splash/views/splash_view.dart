import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medusa_admin/route/app_router.dart';
import '../../../data/repository/auth/auth_repo.dart';
import '../../../data/repository/store/store_repo.dart';
import '../../../data/service/storage_service.dart';
import '../../../data/service/store_service.dart';

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
    String? cookie = StorageService.cookie;
    if (cookie == null) {
      context.router.replaceAll([const SignInRoute()]);
      return;
    }

    final result = await AuthRepo().getSession();

    result.when((success) async {
      if (success.user == null) {
        context.router.replaceAll([const SignInRoute()]);
        return;
      } else {
        await Get.putAsync(() => StoreService(storeRepo: StoreRepo()).init())
            .then((value) {
          context.router.replaceAll([const DashboardRoute()]);
        });
      }
    }, (error) async {
      if (error.code == 401 || error.code == 404) {
        await StorageService.instance.clearCookie();
      }
      debugPrint(error.toString());
      context.router.replaceAll([const SignInRoute()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.theme.appBarTheme.systemOverlayStyle!.copyWith(
          statusBarColor: context.theme.scaffoldBackgroundColor),
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                  tag: 'medusa',
                  child: Image.asset('assets/images/medusa.png', scale: 5)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text.rich(
                  TextSpan(
                    style: GoogleFonts.cabin(
                      fontSize: 42,
                      letterSpacing: 2.0,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Medusa',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: ' Admin',
                        style: TextStyle(
                          color: Color(0xFFFE9879),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
    );
  }
}
