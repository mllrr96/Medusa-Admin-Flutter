import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class ConditionTypeListTile extends StatelessWidget {
  const ConditionTypeListTile({super.key, required this.type, required this.value, this.onChanged, this.enabled});
  final ProductType type;
  final bool value;
  final void Function(bool?)? onChanged;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    return CheckboxListTile(
      enabled: enabled,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(type.value ?? '', style: mediumTextStyle),
      value: value,
      onChanged: onChanged,
    );
  }
}
