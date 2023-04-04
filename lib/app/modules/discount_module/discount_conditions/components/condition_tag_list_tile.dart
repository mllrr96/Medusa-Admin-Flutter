import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class ConditionTagListTile extends StatelessWidget {
  const ConditionTagListTile({Key? key, required this.tag, required this.value, this.onChanged, this.enabled}) : super(key: key);
  final ProductTag tag;
  final bool value;
  final void Function(bool?)? onChanged;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return CheckboxListTile(
      enabled: enabled,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(tag.value ?? '', style: mediumTextStyle),
      value: value,
      onChanged: onChanged,
    );
  }
}
