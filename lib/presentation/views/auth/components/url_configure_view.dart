import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/di/medusa_admin_di.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class UrlConfigureView extends StatefulWidget {
  const UrlConfigureView({super.key});

  @override
  State<UrlConfigureView> createState() => _UrlConfigureViewState();
}

class _UrlConfigureViewState extends State<UrlConfigureView> {
  final formKey = GlobalKey<FormState>();
  final tokenFormKey = GlobalKey<FormState>();
  final textCtrl = TextEditingController();
  final tokenTextCtrl = TextEditingController();
  AuthPreferenceService get authPreferenceService =>
      AuthPreferenceService.instance;
  late bool setupUrl;
  bool advancedOption = false;
  late AuthenticationType authType;
  @override
  void initState() {
    _loadInit();
    super.initState();
  }

  @override
  void dispose() {
    textCtrl.dispose();
    tokenTextCtrl.dispose();
    super.dispose();
  }

  void _loadInit() async {
    authType = authPreferenceService.authPreference.authType;
    if (authType != AuthenticationType.jwt) {
      advancedOption = true;
    }

    if (authPreferenceService.baseUrl == null) {
      setupUrl = true;
    } else {
      setupUrl = false;
      textCtrl.text = authPreferenceService.baseUrl ?? '';
    }
    if (authType == AuthenticationType.token) {
      tokenTextCtrl.text = await getIt<FlutterSecureStorage>()
              .read(key: AppConstants.tokenKey) ??
          '';
    }
  }

  Future<void> _handleMedusaSingleton() async {
    if (setupUrl) {
      await MedusaAdminDi.registerMedusaAdminSingleton();
    } else {
      await MedusaAdminDi.resetMedusaAdminSingleton();
    }
  }

  Future<void> _save({bool skipValidation = false}) async {
    final savedBaseUrl = authPreferenceService.baseUrl;
    final savedAuthType = authPreferenceService.authPreference.authType;
    final savedToken =
        await getIt<FlutterSecureStorage>().read(key: AppConstants.tokenKey);
    // if nothing changed just pop the route
    if (textCtrl.text == savedBaseUrl &&
        savedAuthType == authType &&
        (savedAuthType == AuthenticationType.token
            ? tokenTextCtrl.text == savedToken
            : true) &&
        mounted) {
      context.maybePop();
      return;
    }

    if (!formKey.currentState!.validate() && !skipValidation) {
      return;
    }
    if (!await _advancedOptionSettings()) {
      return;
    }

    //  in case theres '/' in the end remove it
    final url = textCtrl.text.endsWith('/')
        ? textCtrl.text.substring(0, textCtrl.text.length - 1)
        : textCtrl.text;

    await authPreferenceService.updateUrl(url).then(
      (result) async {
        if (result) {
          await authPreferenceService.clearLoginData();
          await authPreferenceService.clearEmail();
          await _handleMedusaSingleton().then((_) {
            context.showSnackBar(setupUrl ? 'URL set' : 'URL updated');
            context.maybePop(true);
          });
        } else {
          context.maybePop(false);
          context.showSnackBar(setupUrl
              ? 'Could not set URL, try again'
              : 'Could not update URL, try again');
        }
      },
    );
  }

  Future<bool> _advancedOptionSettings() async {
    if (!advancedOption) return true;

    if (authType == AuthenticationType.token) {
      if (!tokenFormKey.currentState!.validate()) {
        return false;
      }
      await getIt<FlutterSecureStorage>()
          .write(key: AppConstants.tokenKey, value: tokenTextCtrl.text);
      authPreferenceService.setIsAuthenticated(true);
    }
    try {
      await authPreferenceService.updateAuthPreference(
          authPreferenceService.authPreference.copyWith(authType: authType));

      switch (authType) {
        case AuthenticationType.cookie:
          await getIt<FlutterSecureStorage>()
              .delete(key: AppConstants.tokenKey);
          await getIt<FlutterSecureStorage>().delete(key: AppConstants.jwtKey);
          break;
        case AuthenticationType.token:
          await getIt<FlutterSecureStorage>().delete(key: AppConstants.jwtKey);
          await getIt<FlutterSecureStorage>()
              .delete(key: AppConstants.cookieKey);
          break;

        case AuthenticationType.jwt:
          await getIt<FlutterSecureStorage>()
              .delete(key: AppConstants.tokenKey);
          await getIt<FlutterSecureStorage>()
              .delete(key: AppConstants.cookieKey);
          break;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    String infoText = switch (authType) {
      AuthenticationType.cookie =>
        'Use a cookie session to send authenticated requests.',
      AuthenticationType.token =>
        'Use a user\'s API Token to send authenticated requests.',
      AuthenticationType.jwt =>
        'Use a JWT token to send authenticated requests. (Default)',
    };
    return ShadDialog(
      title: Text(setupUrl ? 'Set URL' : 'Update URL'),
      description: Text(
          setupUrl
              ? 'Set the URL of your Medusa instance'
              : 'Update the URL of your Medusa instance'),
      actions: [
        ShadButton.ghost(
            onPressed: () => context.maybePop(),
            text: const Text('Cancel')),
        ShadButton(
            onPressed: () async => await _save(),
            onLongPress: () async => await _save(skipValidation: true),
            text: const Text('Save')),
      ],
      content: Column(
        children: [
          const Gap(20.0),
          // const SizedBox(height: 20),
          Form(
            key: formKey,
            child: ShadInputFormField(
              controller: textCtrl,
              style: smallTextStyle,
              placeholder: const Text('https://medusajs.com'),
              validator: (val) {
                if (val.isEmpty) {
                  return 'Field is required';
                }

                if (!val.isUrl) {
                  return 'Invalid url';
                }
                return null;
              },
            ),
          ),
          if (!advancedOption)
            Align(
                alignment: Alignment.centerRight,
                child: ShadButton.ghost(
                  onPressed: () =>
                      setState(() => advancedOption = !advancedOption),
                  text: const Text('Advanced Options'),
                  icon: const Icon(Icons.add_link),
                )),
          const Gap(12.0),
          if (advancedOption)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Text('Authentication Method', style: context.bodyMedium),
                const Gap(12.0),
                SizedBox(
                  width: double.maxFinite,
                  child: SegmentedButton<AuthenticationType>(
                      showSelectedIcon: false,
                      onSelectionChanged: (value) =>
                          setState(() => authType = value.first),
                      segments: AuthenticationType.values
                          .map((e) => ButtonSegment<AuthenticationType>(
                          value: e, label: Text(e.toString())))
                          .toList()
                          .reversed
                          .toList(),
                      selected: {authType}),
                ),
                const Gap(12.0),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline,
                          color: ColorManager.manatee),
                      const Gap(12.0),
                      Flexible(
                          child: Text(
                            infoText,
                            style: context.bodySmall
                                ?.copyWith(color: ColorManager.manatee),
                          )),
                    ],
                  ),
                ),
                const Gap(12.0),
                if (authType == AuthenticationType.token)
                  Form(
                    key: tokenFormKey,
                    child: ShadInputFormField(
                      controller: tokenTextCtrl,
                      style: smallTextStyle,
                      placeholder: const Text('Api token'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
