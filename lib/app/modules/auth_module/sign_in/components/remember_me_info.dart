import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class RememberMeInfo extends StatelessWidget {
  const RememberMeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          title: const Text('Remember me'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            children: [
              Text(
                  'This will save your email and password in the device storage, '
                      'for security reasons the app will ask you for biometric authentication (if available) before retrieving your credentials from the storage.',
                  style: context.bodyMedium,
                  textAlign: TextAlign.justify),
              const Gap(12),
              SizedBox(
                  width: double.maxFinite,
                  child: FilledButton(
                      onPressed: () => context.popRoute(true),
                      child: const Text('Got it!'))),
            ],
          ),
        )
      ],
    );
  }
}
