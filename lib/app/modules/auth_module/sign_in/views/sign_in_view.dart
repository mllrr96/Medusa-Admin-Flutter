import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:medusa_admin/app/data/service/language_service.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/error_widget.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../data/repository/auth/auth_repo.dart';
import '../../../components/language_selection/language_selection_view.dart';
import '../components/sign_in_components.dart';
import '../controllers/sign_in_controller.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  void initState() {
    emailCtrl.text = 'admin@medusa-test.com';
    passwordCtrl.text = 'supersecret';
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return GetBuilder<SignInController>(
        init: SignInController(authRepository: AuthRepo()),
        builder: (controller) {
          final tr = context.tr;
          final bool isRTL = context.isRTL;
          const space = Gap(12);
          // Since there no app bar, annotated region is used to apply theme ui overlay
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: context.systemUiOverlayNoAppBarStyle,
            child: GestureDetector(
              onTap: () => context.unfocus(),
              child: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () {
                                  return Align(
                                    alignment: isRTL
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                    child: Hero(
                                      tag: 'closeReset',
                                      child: AdaptiveIcon(
                                        iosPadding: const EdgeInsets.all(16.0),
                                        androidPadding:
                                            const EdgeInsets.all(16.0),
                                        onPressed: () async =>
                                            await controller.changeThemeMode(),
                                        icon: Icon(themeIcon(
                                            controller.themeMode.value)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Align(
                                alignment: isRTL
                                    ? Alignment.topLeft
                                    : Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: AdaptiveButton(
                                    onPressed: () async =>
                                        await showBarModalBottomSheet(
                                      backgroundColor:
                                          context.theme.scaffoldBackgroundColor,
                                      overlayStyle: context
                                          .theme.appBarTheme.systemOverlayStyle,
                                      context: context,
                                      builder: (context) =>
                                          const LanguageSelectionView(),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.language),
                                        const SizedBox(width: 4.0),
                                        Text(LanguageService
                                            .languageModel.nativeName),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Obx(() {
                          //   return GestureDetector(
                          //     onTap: () {
                          //       controller.animate.value =
                          //           !controller.animate.value;
                          //     },
                          //     child: Hero(
                          //       tag: 'medusa',
                          //       child: Image.asset(
                          //         'assets/images/medusa.png',
                          //         scale: 5,
                          //       ).animate(
                          //         effects: [const RotateEffect()],
                          //         // target: controller.animate.value ? 1 : 0,
                          //         autoPlay: true,
                          //       ),
                          //     ),
                          //   );
                          // }),
                          GestureDetector(
                            onTap: () {
                              controller.animate.value =
                                  !controller.animate.value;
                            },
                            child: Hero(
                              tag: 'medusa',
                              child: Image.asset(
                                'assets/images/medusa.png',
                                scale: 5,
                              ).animate(
                                effects: [const RotateEffect()],
                                target: controller.animate.value ? 1 : 0,
                                autoPlay: false,
                              ),
                            ),
                          ),
                          Text(
                            tr.loginCardLogInToMedusa,
                            style: context.headlineMedium,
                          ),
                          space,
                          GestureDetector(
                            onTap: () => controller.errorMessage.value = '',
                            child: errorMessage(
                              errorMessage: controller.errorMessage,
                              context: context,
                              emptyChildHeight: 0,
                              horizontalPadding: 12.0,
                            ),
                          ),
                          space,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              children: [
                                Hero(
                                    tag: 'email',
                                    child: EmailTextField(
                                      controller: emailCtrl,
                                      validator: (val) {
                                        if (val?.isEmpty ?? true) {
                                          return 'Email is required';
                                        }

                                        if (!val!.isEmail) {
                                          return 'Invalid Email';
                                        }

                                        return null;
                                      },
                                    )),
                                const SizedBox(height: 12.0),
                                Hero(
                                  tag: 'password',
                                  child: PasswordTextField(
                                    controller: passwordCtrl,
                                    validator: (val) {
                                      if (val != null && val.isEmpty) {
                                        return 'Password is required';
                                      }
                                      if (val!.length < 8) {
                                        return 'Password should be at least 8 characters long';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Container(
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 12.0, vertical: 4.0),
                              //     width: context.width / 2,
                              //     child: CheckboxListTile(
                              //       value: false,
                              //       onChanged: (val) {},
                              //       contentPadding: EdgeInsets.zero,
                              //       controlAffinity:
                              //           ListTileControlAffinity.leading,
                              //       title: Text(
                              //         'Remember me',
                              //         style: smallTextStyle,
                              //       ),
                              //     )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: TextButton(
                                  child: Text(
                                    tr.loginCardForgotYourPassword,
                                    style: context.bodySmall,
                                  ),
                                  onPressed: () {
                                    if (controller
                                        .errorMessage.value.isNotEmpty) {
                                      controller.errorMessage.value = '';
                                    }
                                    // Get.toNamed(Routes.RESET_PASSWORD);
                                    context
                                        .pushRoute(const ResetPasswordRoute());
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Hero(
                              tag: 'continue',
                              child: SignInButton(
                                onPressed: () async {
                                  if (!formKey.currentState!.validate()) {
                                    return;
                                  }
                                  if (!await InternetConnection()
                                      .hasInternetAccess) {
                                    await Fluttertoast.showToast(
                                        msg: 'No internet connection!');
                                    return;
                                  }
                                  if (context.mounted) {
                                    context.unfocus();
                                  }
                                  await controller
                                      .signIn(emailCtrl.text, passwordCtrl.text)
                                      .then((value) {
                                    if (value) {
                                      context.router
                                          .replaceAll([const DashboardRoute()]);
                                    }
                                  });
                                },
                                label: tr.analyticsPreferencesContinue,
                                buttonWidth: double.maxFinite,
                              ),
                            ),
                          ),
                          space,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: AdaptiveButton(
                              onPressed: () async {
                                await showBarModalBottomSheet(
                                    context: context,
                                    overlayStyle: context
                                        .theme.appBarTheme.systemOverlayStyle,
                                    builder: (context) {
                                      return const UrlUpdateView();
                                    });
                              },
                              child: const Text('Change url'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  IconData themeIcon(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return Icons.brightness_auto;
      case ThemeMode.light:
        return MedusaIcons.sun;
      case ThemeMode.dark:
        return MedusaIcons.moon;
    }
  }
}

class UrlUpdateView extends StatefulWidget {
  const UrlUpdateView({super.key});

  @override
  State<UrlUpdateView> createState() => _UrlUpdateViewState();
}

class _UrlUpdateViewState extends State<UrlUpdateView> {
  final formKey = GlobalKey<FormState>();
  final textCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final bottomPadding =
        context.bottomViewPadding == 0 ? 20.0 : context.bottomViewPadding;

    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              leading: const AdaptiveBackButton(),
              title: const Text('Update url'),
              actions: [
                TextButton(
                    onLongPress: () async => await StorageService.instance
                            .updateUrl(textCtrl.text)
                            .then(
                          (result) {
                            context.popRoute();
                            if (result) {
                              context
                                  .showSnackBar('Url updated, restart the app');
                            } else {
                              context.showSnackBar('Could not update url');
                            }
                          },
                        ),
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      await StorageService.instance
                          .updateUrl(textCtrl.text)
                          .then(
                        (result) {
                          context.popRoute();
                          if (result) {
                            context
                                .showSnackBar('Url updated, restart the app');
                          } else {
                            context.showSnackBar('Could not update url');
                          }
                        },
                      );
                    },
                    child: const Text('Save'))
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  12.0, 8.0, 12.0, context.bottomViewInsetPadding + 8.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '* Tip: to skip url verification, press and hold Save button',
                          style: context.bodyMedium),
                      Text(
                          '* Make sure to restart the app after updating baseurl',
                          style: context.bodyMedium),
                      Text('* base url MUST end with /admin',
                          style: context.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      textCtrl.text = StorageService.baseUrl;
                    },
                    child: Text('Current url : ${StorageService.baseUrl}',
                        style: smallTextStyle),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: textCtrl,
                    style: smallTextStyle,
                    decoration: const InputDecoration(
                        hintText: 'https://medusajs.com/admin'),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Field is required';
                      }

                      if (!val.isURL) {
                        return 'Invalid url';
                      }

                      if (!val.contains('admin')) {
                        return 'Url must end with /admin';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: bottomPadding),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
