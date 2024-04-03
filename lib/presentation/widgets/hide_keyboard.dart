import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class HideKeyboard extends StatelessWidget {
  const HideKeyboard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.unfocus(),
      child: child,
    );
  }
}
