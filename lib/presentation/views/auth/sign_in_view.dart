import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/theme_mode_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/blocs/app_update/app_update_bloc.dart';
import 'package:medusa_admin/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:medusa_admin/presentation/cubits/theme/theme_cubit.dart';
import 'package:medusa_admin/presentation/widgets/email_text_field.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/language_selection/language_selection_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
  bool get isSessionExpired => widget.onResult != null;
  bool showUpdateButton = false;
  late Timer timer;

  @override
  void initState() {
    timer = Timer(3.seconds, () {
      if (mounted) {
        setState(() => showUpdateButton = context
            .read<AppUpdateBloc>()
            .state
            .maybeMap(updateAvailable: (_) => true, orElse: () => false));
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
          if (!isSessionExpired) {
            if (context.mounted) {
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
                appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<ThemeCubit, ThemeState>(
                            builder: (context, state) {
                              return ShadButton.outline(
                                icon: Icon(
                                  state.themeMode.icon,
                                  size: 16,
                                ),
                                size: ShadButtonSize.icon,
                                onPressed: () => context
                                    .read<ThemeCubit>()
                                    .updateThemeState(
                                        themeMode: state.themeMode.next),
                              );
                            },
                          ),
                          ShadButton.outline(
                            // text:Text(context
                            //     .read<LanguageCubit>()
                            //     .state
                            //     .locale
                            //     .languageModel
                            //     .nativeName),
                            icon: const Icon(
                              LucideIcons.languages,
                              size: 16,
                            ),
                            size: ShadButtonSize.icon,
                            onPressed: () async =>
                                await showBarModalBottomSheet(
                              backgroundColor:
                                  context.theme.scaffoldBackgroundColor,
                              overlayStyle:
                                  context.theme.appBarTheme.systemOverlayStyle,
                              context: context,
                              builder: (context) =>
                                  const LanguageSelectionView(),
                            ),
                          ),
                        ],
                      ),
                    )),
                bottomNavigationBar: AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: BlocBuilder<AppUpdateBloc, AppUpdateState>(
                      builder: (context, state) {
                        final appUpdate = context
                            .read<AppUpdateBloc>()
                            .state
                            .whenOrNull(updateAvailable: (update) => update);
                        return ShadButton(
                          // height: 56,
                          onPressed: () {},
                          gradient: const LinearGradient(colors: [
                            Colors.cyan,
                            Colors.indigo,
                          ]),
                          shadows: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(.4),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          text: Text(
                            'New Update Available ${appUpdate?.tagName ?? ''}',
                          ),
                          icon: const Icon(LucideIcons.download),
                        );
                      },
                    ),
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
                              final result = await showShadDialog(
                                  context: context,
                                  builder: (context) =>
                                      const UrlConfigureView());
                              if (result == true) {
                                emailCtrl.text =
                                    AuthPreferenceService.email ?? '';
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
                                  builder: (context) =>
                                      const UrlConfigureView());
                              if (result == true) {
                                emailCtrl.text =
                                    AuthPreferenceService.email ?? '';
                                setState(() {});
                              }
                            },
                    ),
                  )
                ],
                body: SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: ShadCard(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(isSessionExpired
                                      ? 'Re-authenticate to Medusa'
                                      : tr.loginCardLogInToMedusa),
                                  Hero(
                                      tag: 'medusa',
                                      child: SignInMedusaLogo(rotate: loading)),
                                ],
                              ),
                              footer: Center(
                                child: ShadButton(
                                  text: const Text('Continue'),
                                  size: ShadButtonSize.lg,
                                  width: 220,
                                  height: 48.0,
                                  onPressed: loading
                                      ? null
                                      : () async {
                                          if (!_validate()) {
                                            return;
                                          }
                                          await _signIn();
                                        },
                                  icon: const Icon(Icons.login),
                                ),
                              ),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (!useToken)
                                    Column(
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
                                        space,
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
                                  space,
                                  if (!isSessionExpired && !useToken)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ShadButton.ghost(
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
                                          text: Text(
                                            tr.loginCardForgotYourPassword,
                                          ),
                                        ),
                                      ],
                                    ),
                                  space,
                                ],
                              ),
                            ),
                          ),
                        ),
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
}
