import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/data/service/storage_service.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class UrlUpdateView extends StatefulWidget {
  const UrlUpdateView({super.key});

  @override
  State<UrlUpdateView> createState() => _UrlUpdateViewState();
}

class _UrlUpdateViewState extends State<UrlUpdateView> {
  final formKey = GlobalKey<FormState>();
  final textCtrl = TextEditingController();
  late bool setupUrl;

  @override
  void initState() {
    if (StorageService.baseUrl == null) {
      setupUrl = true;
    } else {
      setupUrl = false;
    }
    super.initState();
  }

  void _handleMedusaSingleton(String url) {
    if (setupUrl && !getIt.isRegistered<MedusaAdmin>()) {
      getIt.registerLazySingleton<MedusaAdmin>(() => MedusaAdmin.initialize(
            prefs: getIt<SharedPreferences>(),
            config: MedusaConfig(
              baseUrl: url,
              enableDebugging: false,
            ),
          ));
      // reset the singleton
    } else {
      getIt.resetLazySingleton<MedusaAdmin>();
    }
  }

  Future<void> _save({bool skipValidation = false}) async {
    if (StorageService.baseUrl == textCtrl.text && !setupUrl) {
      context.popRoute();
      return;
    }

    if (!formKey.currentState!.validate() && !skipValidation) {
      return;
    }
    //  in case theres '/' in the end remove it
    final url = textCtrl.text.endsWith('/')
        ? textCtrl.text.substring(0, textCtrl.text.length - 1)
        : textCtrl.text;

    // create/update Medusa Admin singleton
    _handleMedusaSingleton(url);

    await StorageService.instance.updateUrl(url).then(
      (result) async {
        if (result) {
          await StorageService.instance.clearLoginData();
          await StorageService.instance.clearEmail();
          await StorageService.instance.clearCookie().then((_) {
            context.popRoute(true);
            context.showSnackBar(setupUrl ? 'URL set' : 'URL updated');
          });
        } else {
          context.popRoute(false);
          context.showSnackBar(setupUrl
              ? 'Could not set URL, try again'
              : 'Could not update URL, try again');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final bottomPadding =
        context.bottomViewPadding == 0 ? 20.0 : context.bottomViewPadding;
    final baseUrl = StorageService.baseUrl;
    return Form(
      key: formKey,
      child: Container(
        color: context.theme.scaffoldBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title:
                  setupUrl ? const Text('Set URL') : const Text('Update URL'),
              actions: [
                TextButton(
                    onPressed: () async => await _save(),
                    onLongPress: () async => await _save(skipValidation: true),
                    child: const Text('Save'))
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  12.0, 8.0, 12.0, context.bottomViewInsetPadding + 8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  if (!setupUrl)
                    InkWell(
                      onTap: () async {
                        textCtrl.text = baseUrl ?? '';
                      },
                      child:
                          Text('Current URL : $baseUrl', style: smallTextStyle),
                    ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: textCtrl,
                    style: smallTextStyle,
                    decoration:
                        const InputDecoration(hintText: 'https://medusajs.com'),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Field is required';
                      }

                      if (!val.isURL) {
                        return 'Invalid url';
                      }

                      if (val.endsWith('/store')) {
                        return 'Please remove /store from the end of the url';
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
