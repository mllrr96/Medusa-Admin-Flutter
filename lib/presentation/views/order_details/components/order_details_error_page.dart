import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class OrderDetailsErrorPage extends StatelessWidget {
  const OrderDetailsErrorPage(this.message,{super.key, this.onRetryTap, });
  final String message;
  final void Function()? onRetryTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Error retrieving data', style: context.bodyLarge),
        const Gap(10.0),
        FilledButton(
            onPressed: onRetryTap,
            child: const Text('   Retry   ')),
        const Gap(10.0),
        Text(message),
      ],
    );
  }
}
