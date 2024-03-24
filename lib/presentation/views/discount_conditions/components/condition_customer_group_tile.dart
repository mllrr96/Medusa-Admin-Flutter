import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

class ConditionCustomerGroupTile extends StatelessWidget {
  const ConditionCustomerGroupTile(
      {super.key, required this.customerGroup, required this.value, this.onChanged, this.enabled});
  final CustomerGroup customerGroup;
  final bool value;
  final void Function(bool?)? onChanged;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    return CheckboxListTile(
      enabled: enabled,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(customerGroup.name ?? '', style: mediumTextStyle),
      subtitle: Text('Members: ${customerGroup.customers?.length ?? 0}', style: smallTextStyle),
      value: value,
      onChanged: onChanged,
    );
  }
}
