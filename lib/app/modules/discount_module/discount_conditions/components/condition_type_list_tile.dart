import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class ConditionTypeListTile extends StatelessWidget {
  const ConditionTypeListTile({Key? key, required this.type, required this.value, this.onChanged, this.enabled}) : super(key: key);
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
