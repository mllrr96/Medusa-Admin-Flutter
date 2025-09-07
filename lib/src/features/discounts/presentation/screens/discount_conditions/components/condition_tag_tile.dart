import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

class ConditionTagTile extends StatelessWidget {
  const ConditionTagTile({super.key, required this.tag, required this.value, this.onChanged, this.enabled});
  final ProductTag tag;
  final bool value;
  final void Function(bool?)? onChanged;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    return CheckboxListTile(
      enabled: enabled,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(tag.value, style: mediumTextStyle),
      value: value,
      onChanged: onChanged,
    );
  }
}
