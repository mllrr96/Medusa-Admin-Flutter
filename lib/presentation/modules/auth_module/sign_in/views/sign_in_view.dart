import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medusa_admin/data/service/language_service.dart';
import 'package:medusa_admin/data/service/storage_service.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/theme_mode_extension.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/use_case/auth_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/language_selection/language_selection_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../components/index.dart';
import '../controllers/sign_in_controller.dart';


@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({super.key, this.onResult});
  final void Function(bool)? onResult;
  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  late bool? useBiometric;
  late bool showAuthenticateButton;
  bool get reAuthenticate => widget.onResult != null;
  @override
  void initState() {
    _onInit();
    super.initState();
  }

  void _onInit() {
    useBiometric = StorageService.appSettings.useBiometric;
    emailCtrl.text = StorageService.email ?? '';
    if (useBiometric == true && (StorageService.email?.isNotEmpty ?? false)) {
      showAuthenticateButton = true;
    } else {
      showAuthenticateButton = false;
    }
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _biometricAuthentication(SignInController ctrl) async {
    if (StorageService.appSettings.useBiometric == true) {
      final result = await StorageService.instance.loadLoginData();
      result.when((success) async {
        ctrl.loading = true;
        ctrl.update();
        await ctrl
            .login(success.$1, success.$2, context: context)
            .then((value) {
          if (value) {
            if (widget.onResult == null) {
              context.router.replaceAll([const DashboardRoute()]);
            } else {
              widget.onResult?.call(true);
            }
          } else {
            ctrl.loading = false;
            ctrl.update();
          }
        });
      }, (error) => context.showSignInErrorSnackBar(error));
    }
  }

  Future<bool> _validate() async {
    if (StorageService.baseUrl == null) {
      context.showSignInErrorSnackBar('Please set your backend URL first');
      return false;
    }
    if (!formKey.currentState!.validate()) {
      return false;
    }
    if (!await InternetConnection().hasInternetAccess) {
      await Fluttertoast.showToast(
          msg: 'Check your internet connection and try again.');
      if (context.mounted) {
        context.unfocus();
      }
      return false;
    }
    if (context.mounted) {
      context.unfocus();
    }
    return true;
  }

  Future<void> _showBiometricDialog() async {
    final canUseBiometric =
        await getIt<LocalAuthentication>().canCheckBiometrics &&
            await getIt<LocalAuthentication>().isDeviceSupported();
    if (useBiometric == null && context.mounted && canUseBiometric) {
      final result = await showModalBottomSheet<bool?>(
          context: context, builder: (context) => const UseBiometricReminder());
      if (result == true) {
        await StorageService.instance
            .saveLoginData(emailCtrl.text, passwordCtrl.text);
      }
      // wait for the modal to close
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  Future<void> _signIn(SignInController controller) async {
    controller.loading = true;
    controller.update();
    await _validate().then((valid) async {
      if (!valid) {
        controller.loading = false;
        controller.update();
        return;
      }
      await controller
          .login(emailCtrl.text, passwordCtrl.text, context: context)
          .then((value) async {
        if (value) {
          // show enable biometric dialog
          await _showBiometricDialog();

          if (!reAuthenticate && mounted) {
            context.router.replaceAll([const DashboardRoute()]);
          } else if (reAuthenticate) {
            widget.onResult?.call(true);
          }
        }
      });
    });
  }

  @override
  Widget build(context) {
    return PopScope(
      canPop: !reAuthenticate,
      child: GetBuilder<SignInController>(
          init: SignInController(AuthenticationUseCase.instance),
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
                  persistentFooterAlignment: AlignmentDirectional.center,
                  persistentFooterButtons: [
                    SignInFooterButtons(
                      reAuthenticate,
                      onGoToSignInPressed: controller.loading
                          ? null
                          : () => context.router.replaceAll([SignInRoute()]),
                      onUrlPressed: controller.loading
                          ? null
                          : () async {
                              final result = await showBarModalBottomSheet(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  context: context,
                                  overlayStyle:
                                      context.systemUiOverlayNoAppBarStyle,
                                  builder: (context) => const UrlUpdateView());
                              if (result == true) {
                                _onInit();
                                setState(() {});
                              }
                            },
                    )
                  ],
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: isRTL
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                    child: ElevatedButton.icon(
                                      label: Text(controller
                                              .themeMode.name.capitalize ??
                                          controller.themeMode.name),
                                      onPressed: () async =>
                                          await controller.changeThemeMode(),
                                      icon: Icon(controller.themeMode.icon),
                                    ),
                                  ),
                                  ElevatedButton.icon(
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
                                    icon: const Icon(Icons.language),
                                    label: Text(LanguageService
                                        .languageModel.nativeName),
                                  ),
                                ],
                              ),
                            ),
                            Hero(
                                tag: 'medusa',
                                child: SignInMedusaLogo(
                                    rotate: controller.loading)),
                            Text(
                              reAuthenticate
                                  ? 'Re-authenticate to Medusa'
                                  : tr.loginCardLogInToMedusa,
                              style: context.headlineMedium,
                            ),
                            space,
                            space,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                children: [
                                  Hero(
                                      tag: 'email',
                                      child: EmailTextField(
                                        readOnly: showAuthenticateButton &&
                                            (StorageService.email?.isNotEmpty ??
                                                false),
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
                            space,
                            if (!reAuthenticate)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: controller.loading
                                          ? null
                                          : () {
                                              if (StorageService.baseUrl ==
                                                  null) {
                                                context.showSignInErrorSnackBar(
                                                    'Please set your backend URL first');
                                                return;
                                              }
                                              context.pushRoute(
                                                  const ResetPasswordRoute());
                                            },
                                      child: Text(
                                        tr.loginCardForgotYourPassword,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            space,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Hero(
                                tag: 'continue',
                                child: FilledButton.icon(
                                    style: FilledButton.styleFrom(
                                      minimumSize: const Size(220, 48.0),
                                    ),
                                    onPressed: controller.loading
                                        ? null
                                        : () async => await _signIn(controller),
                                    icon: const Icon(Icons.login),
                                    label:
                                        Text(tr.analyticsPreferencesContinue)),
                              ),
                            ),
                            space,
                            if (showAuthenticateButton)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Expanded(child: Divider()),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            'Or',
                                            style: TextStyle(
                                                color: ColorManager.manatee),
                                          ),
                                        ),
                                        const Expanded(child: Divider()),
                                      ],
                                    ),
                                    space,
                                    OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: const Size(220, 48.0),
                                        side: BorderSide(
                                            color: context.theme.primaryColor),
                                      ),
                                      onPressed: controller.loading
                                          ? null
                                          : () async =>
                                              await _biometricAuthentication(
                                                  controller),
                                      icon: const Icon(Icons.fingerprint),
                                      label: const Text('Authenticate'),
                                    ),
                                  ],
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
          }),
    );
  }
}
