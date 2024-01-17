import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/extension.dart';

class ConditionCollectionListTile extends StatelessWidget {
  const ConditionCollectionListTile({super.key, required this.collection, required this.value, this.onChanged, this.enabled});
  final ProductCollection collection;
  final bool value;
  final void Function(bool?)? onChanged;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    return CheckboxListTile(
      enabled: enabled,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(collection.title ?? '', style: mediumTextStyle),
      value: value,
      onChanged: onChanged,
    );
  }
}
