import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medusa_admin/data/service/language_service.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/theme_mode_extension.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/data/service/store_service.dart';
import 'package:medusa_admin/domain/use_case/auth_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/modules/activity_module/activity_controller.dart';
import 'package:medusa_admin/presentation/widgets/language_selection/language_selection_view.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import '../components/index.dart';
import '../controllers/sign_in_controller.dart';
import 'package:medusa_admin/core/utils/enums.dart';

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
  bool get isSessionExpired => widget.onResult != null;

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  void _onInit() {
    useBiometric = AuthPreferenceService.authPreference.useBiometric;
    emailCtrl.text = AuthPreferenceService.email ?? '';
    if (useBiometric == true &&
        (AuthPreferenceService.email?.isNotEmpty ?? false)) {
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
    if (AuthPreferenceService.authPreference.useBiometric == true) {
      final result = await AuthPreferenceService.instance.loadLoginData();
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
    if (AuthPreferenceService.baseUrl == null) {
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
          isDismissible: false,
          enableDrag: false,
          context: context,
          builder: (context) => const UseBiometricReminder());
      if (result == true) {
        await AuthPreferenceService.instance
            .saveLoginData(emailCtrl.text, passwordCtrl.text);
      }
      // wait for the modal to close
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  Future<void> _signIn(SignInController controller) async {
    controller.loading = true;
    controller.update();
    if (!await _validate()) {
      controller.loading = false;
      controller.update();
      return;
    }
    if (!mounted) return;
    await controller
        .login(emailCtrl.text, passwordCtrl.text, context: context)
        .then((value) async {
      if (value) {
        // show enable biometric dialog
        if (AuthPreferenceService.authType != AuthenticationType.token) {
          await _showBiometricDialog();
        }

        if (!isSessionExpired && mounted) {
          context.router.replaceAll([const DashboardRoute()]);
        } else if (isSessionExpired) {
          widget.onResult?.call(true);
        }
      }
    });
  }

  Future<void> _signInWithToken(SignInController controller) async {
    controller.loading = true;
    controller.update();
    final result = await AuthenticationUseCase.instance.getCurrentUser();

    await result.when((success) async {
      AuthPreferenceService.instance.setIsAuthenticated(true);
      await Get.putAsync(() =>
          StoreService(storeRepo: getIt<MedusaAdmin>().storeRepository).init());
      Get.put(ActivityController());
      if (ActivityController.instance.pagingController.itemList?.isNotEmpty ??
          false) {
        ActivityController.instance.pagingController.refresh();
      }
      if (mounted) {
        context.router.replaceAll([const DashboardRoute()]);
      }
    }, (error) {
      controller.loading = false;
      controller.update();
      if (error.code == 401) {
        context.showSignInErrorSnackBar(
            'Invalid token, Make sure you have set your API Token correctly');
      } else {
        context.showSignInErrorSnackBar(error.toSnackBarString());
      }
    });
  }

  @override
  Widget build(context) {
    return PopScope(
      canPop: !isSessionExpired,
      child: GetBuilder<SignInController>(
        init: SignInController(AuthenticationUseCase.instance),
        builder: (controller) {
          final tr = context.tr;
          final useToken =
              AuthPreferenceService.authType == AuthenticationType.token;
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
                    isSessionExpired,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  label: Text(
                                      controller.themeMode.name.capitalize ??
                                          controller.themeMode.name),
                                  onPressed: () async =>
                                      await controller.changeThemeMode(),
                                  icon: Icon(controller.themeMode.icon),
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
                                  label: Text(
                                      LanguageService.languageModel.nativeName),
                                ),
                              ],
                            ),
                          ),
                          Hero(
                              tag: 'medusa',
                              child:
                                  SignInMedusaLogo(rotate: controller.loading)),
                          Text(
                            isSessionExpired
                                ? 'Re-authenticate to Medusa'
                                : tr.loginCardLogInToMedusa,
                            style: context.headlineMedium,
                          ),
                          space,
                          space,
                          if (!useToken)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                children: [
                                  Hero(
                                      tag: 'email',
                                      child: EmailTextField(
                                        readOnly: showAuthenticateButton &&
                                            (AuthPreferenceService
                                                    .email?.isNotEmpty ??
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
                          if (!isSessionExpired && !useToken)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: controller.loading
                                        ? null
                                        : () {
                                            if (AuthPreferenceService.baseUrl ==
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
                                      : () async => useToken
                                          ? await _signInWithToken(controller)
                                          : await _signIn(controller),
                                  icon: const Icon(Icons.login),
                                  label: Text(tr.analyticsPreferencesContinue)),
                            ),
                          ),
                          space,
                          if (showAuthenticateButton && !useToken)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                children: [
                                  const Row(
                                    children: [
                                      Expanded(child: Divider()),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          'Or',
                                          style: TextStyle(
                                              color: ColorManager.manatee),
                                        ),
                                      ),
                                      Expanded(child: Divider()),
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
        },
      ),
    );
  }
}
