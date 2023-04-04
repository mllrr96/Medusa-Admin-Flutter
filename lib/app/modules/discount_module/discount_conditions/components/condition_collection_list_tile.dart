import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class ConditionCollectionListTile extends StatelessWidget {
  const ConditionCollectionListTile({Key? key, required this.collection, required this.value, this.onChanged, this.enabled}) : super(key: key);
  final ProductCollection collection;
  final bool value;
  final void Function(bool?)? onChanged;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return CheckboxListTile(
      enabled: enabled,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(collection.title ?? '', style: mediumTextStyle),
      value: value,
      onChanged: onChanged,
    );
  }
}
