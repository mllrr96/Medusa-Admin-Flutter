import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/core/di/di.dart';

class UseBiometricReminder extends StatelessWidget {
  const UseBiometricReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      height: context.height / 2,
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Biometric Authentication'),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Gap(12),
                  Icon(Icons.fingerprint,
                      size: 80, color: context.theme.primaryColor),
                  Text(
                      'Use biometric authentication to sign in faster and more securely ?',
                      style: context.bodyMedium,
                      textAlign: TextAlign.justify),
                  // const Gap(12),
                  Column(
                    children: [
                      FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(100, 48),
                          ),
                          onPressed: () async {
                            try {
                              await getIt<LocalAuthentication>()
                                  .authenticate(
                                localizedReason:
                                    'Please authenticate to enable biometric authentication.',
                              )
                                  .then((value) {
                                context.popRoute(value);
                              });
                            } catch (_) {
                              if (context.mounted) {
                                context.popRoute(false);
                              }
                            }
                          },
                          child: const Text('Enable Biometric Authentication')),
                      const Gap(12.0),
                      TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: const Size(100, 48),
                          ),
                          onPressed: () => context.popRoute(false),
                          child: const Text('Skip')),
                      const Gap(12),
                      Text(
                        '* You can enable this feature later in settings.',
                        style: context.bodySmall
                            ?.copyWith(color: ColorManager.manatee),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
