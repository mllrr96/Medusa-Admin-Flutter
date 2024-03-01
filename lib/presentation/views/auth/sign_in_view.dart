import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' hide GetNumUtils;
import 'package:local_auth/local_auth.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/extension/locale_extension.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/theme_mode_extension.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/blocs/app_update/app_update_bloc.dart';
import 'package:medusa_admin/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:medusa_admin/presentation/cubits/language/language_cubit.dart';
import 'package:medusa_admin/presentation/cubits/theme/theme_cubit.dart';
import 'package:medusa_admin/presentation/modules/activity_module/activity_controller.dart';
import 'package:medusa_admin/presentation/widgets/email_text_field.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/language_selection/language_selection_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/utils/enums.dart';

import 'components/index.dart';

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
  bool showUpdateButton = false;
  late Timer timer;

  @override
  void initState() {
    _onInit();
    timer = Timer(3.seconds, () {
      if (mounted) {
        setState(() => showUpdateButton = context.read<AppUpdateBloc>().state.mapOrNull(updateAvailable: (_) => true) ?? false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(context) {
    final tr = context.tr;
    final useToken =
        AuthPreferenceService.authTypeGetter == AuthenticationType.token;
    const space = Gap(12);
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.mapOrNull(loggedIn: (_) async {
          // show biometric auth dialog
          if (AuthPreferenceService.authTypeGetter !=
              AuthenticationType.token) {
            await _showBiometricDialog();
          }
          if (!isSessionExpired) {
            Get.put(ActivityController());
            if (ActivityController
                    .instance.pagingController.itemList?.isNotEmpty ??
                false) {
              ActivityController.instance.pagingController.refresh();
            }
            if (mounted) {
              context.router.replaceAll([const DashboardRoute()]);
            }
          } else if (isSessionExpired) {
            widget.onResult?.call(true);
          }
        }, error: (e) {
          if (AuthPreferenceService.authTypeGetter ==
                  AuthenticationType.token &&
              e.failure.code == 401) {
            context.showSignInErrorSnackBar(
                'Invalid token, Make sure you have set your API Token correctly');
          } else if (e.failure.code == 401) {
            context.showSignInErrorSnackBar(AppConstants.unauthorizedMessage);
          } else {
            context.showSignInErrorSnackBar(e.failure.toSnackBarString());
          }
        });
      },
      builder: (context, state) {
        bool loading = state == const AuthenticationState.loading();
        return PopScope(
          canPop: !isSessionExpired,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: context.systemUiOverlayNoAppBarStyle,
            child: HideKeyboard(
              child: Scaffold(
                bottomNavigationBar: AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: updateButton,
                    crossFadeState: showUpdateButton && !loading
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: 300.ms),
                persistentFooterAlignment: AlignmentDirectional.center,
                persistentFooterButtons: [
                  Padding(
                    padding: EdgeInsets.only(bottom: context.bottomViewPadding),
                    child: SignInFooterButtons(
                      isSessionExpired,
                      onGoToSignInPressed: loading
                          ? null
                          : () => context.router.replaceAll([SignInRoute()]),
                      onUrlPressed: loading
                          ? null
                          : () async {
                              final result = await context
                                  .pushRoute(const UrlConfigureRoute());
                              if (result == true) {
                                _onInit();
                                setState(() {});
                              }
                            },
                      onUrlLongPressed: loading
                          ? null
                          : () async {
                              final result = await showBarModalBottomSheet(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  context: context,
                                  overlayStyle:
                                      context.systemUiOverlayNoAppBarStyle,
                                  builder: (context) => const UrlConfigureView());
                              if (result == true) {
                                _onInit();
                                setState(() {});
                              }
                            },
                    ),
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
                                BlocBuilder<ThemeCubit, ThemeState>(
                                  builder: (context, state) {
                                    return ElevatedButton.icon(
                                      label: Text(
                                          state.themeMode.name.capitalize ??
                                              state.themeMode.name),
                                      onPressed: () => context
                                          .read<ThemeCubit>()
                                          .updateThemeState(
                                              themeMode: state.themeMode.next),
                                      icon: Icon(state.themeMode.icon),
                                    );
                                  },
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
                                      context.read<LanguageCubit>().state.locale.languageModel.nativeName),
                                ),
                              ],
                            ),
                          ),
                          Hero(
                              tag: 'medusa',
                              child: SignInMedusaLogo(rotate: loading)),
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
                                    onPressed: loading
                                        ? null
                                        : () {
                                            if (AuthPreferenceService
                                                    .baseUrlGetter ==
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
                                  onPressed: loading
                                      ? null
                                      : () async {
                                          if (!_validate()) {
                                            return;
                                          }
                                          await _signIn();
                                        },
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
                                    onPressed: loading
                                        ? null
                                        : () async =>
                                            await _biometricAuthentication(),
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
          ),
        );
      },
    );
  }

  Future<void> _signIn() async {
    switch (AuthPreferenceService.authTypeGetter) {
      case AuthenticationType.cookie:
        context.read<AuthenticationBloc>().add(
            AuthenticationEvent.logInCookie(emailCtrl.text, passwordCtrl.text));
        break;
      case AuthenticationType.jwt:
        context.read<AuthenticationBloc>().add(
            AuthenticationEvent.logInJWT(emailCtrl.text, passwordCtrl.text));
        break;
      case AuthenticationType.token:
        context
            .read<AuthenticationBloc>()
            .add(const AuthenticationEvent.logInToken());
        break;
    }
  }

  void _onInit() {
    useBiometric = AuthPreferenceService.authPreferenceGetter.useBiometric;
    emailCtrl.text = AuthPreferenceService.email ?? '';
    if (useBiometric == true &&
        (AuthPreferenceService.email?.isNotEmpty ?? false)) {
      showAuthenticateButton = true;
    } else {
      showAuthenticateButton = false;
    }
  }

  Future<void> _biometricAuthentication() async {
    if (AuthPreferenceService.authPreferenceGetter.useBiometric == true) {
      final result = await AuthPreferenceService.instance.loadLoginData();
      result.when((success) async {
        // setLoading(true);
        await _signIn();
      }, (error) => context.showSignInErrorSnackBar(error));
    }
  }

  bool _validate() {
    if (AuthPreferenceService.baseUrlGetter == null) {
      context.showSignInErrorSnackBar('Please set your backend URL first');
      return false;
    }
    if (!formKey.currentState!.validate()) {
      return false;
    }
    context.unfocus();

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

  Widget get updateButton => Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 5),
        child: Stack(
          children: [
            Container(
              height: 56,
              width: double.infinity,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Colors.blue,
              ),
            )
                .animate(
                    autoPlay: true,
                    onPlay: (controller) => controller.repeat(reverse: true))
                .shimmer(
                    duration: const Duration(seconds: 5),
                    blendMode: BlendMode.srcIn,
                    colors: [Colors.blue, Colors.green, Colors.teal]),
            Material(
              color: Colors.transparent,
              shape: const StadiumBorder(),
              child: InkWell(
                customBorder: const StadiumBorder(),
                onTap: () => context.pushRoute(const AppUpdateRoute()),
                child: Ink(
                  height: 56,
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 10, 16),
                        child: Icon(Icons.update, color: Colors.white),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'New Update Available ${context.read<AppUpdateBloc>().state.mapOrNull(updateAvailable: (_)=> _.appUpdate)?.tagName ?? ''}',
                              style: const TextStyle(color: Colors.white)),
                          Text('Tap to install',
                              style: context.bodySmall
                                  ?.copyWith(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
