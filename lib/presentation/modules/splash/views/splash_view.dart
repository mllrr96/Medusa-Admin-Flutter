import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' hide GetNumUtils;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/data/service/store_service.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:medusa_admin/presentation/modules/activity_module/activity_controller.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer timer;
  bool takingTooLong = false;

  @override
  void initState() {
    timer = Timer(15.seconds, () {
      setState(() => takingTooLong = true);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.mapOrNull(
          loggedIn: (loggedIn) async {
            await Get.putAsync(() =>
                StoreService(storeRepo: getIt<MedusaAdmin>().storeRepository)
                    .init()).then((value) {
              Get.put(ActivityController());
              context.router.replaceAll([const DashboardRoute()]);
            });
          },
          loggedOut: (_) {
            context.router.replaceAll([SignInRoute()]);
          },
          error: (error) {
            context.showSignInErrorSnackBar(error.failure.toSnackBarString());
            context.router.replaceAll([SignInRoute()]);
          },
        );
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: context.systemUiOverlayNoAppBarStyle,
        child: Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: context.height,
                width: context.width,
                color: context.theme.scaffoldBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                        tag: 'medusa',
                        child:
                            Image.asset('assets/images/medusa.png', scale: 5)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text('Medusa Admin', style: context.headlineLarge),
                    ),
                    const Gap(15),
                    LoadingAnimationWidget.staggeredDotsWave(
                        color: context.theme.primaryColor, size: 40),
                    const Gap(15),
                  ],
                ),
              ),
              if (takingTooLong)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Taking too long to load?'),
                    const Gap(10),
                    OutlinedButton(
                        onPressed: () =>
                            context.router.replaceAll([SignInRoute()]),
                        child: const Text('Go to login')),
                    const Gap(10),
                  ],
                )
                    .animate()
                    .fadeIn(duration: 200.ms)
                    .move(begin: const Offset(0, 10), curve: Curves.easeOutQuad)
            ],
          ),
        ),
      ),
    );
  }
}
