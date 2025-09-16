import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

class StoreDetailsFab extends StatelessWidget {
  const StoreDetailsFab({super.key, required this.currenciesCount, this.onRemove, this.onClear});

  final int currenciesCount;
  final void Function()? onRemove;
  final void Function()? onClear;

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 0, 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Theme.of(context).appBarTheme.backgroundColor?.withValues(alpha: 0.7),
        ),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(8),
              Text('$currenciesCount selected', style: mediumTextStyle),
              const VerticalDivider(width: 24),
              InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                onTap: onRemove,
                child: Ink(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text('Remove', style: mediumTextStyle?.copyWith(color: Colors.redAccent)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0, 3.0, 0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onClear,
                  icon: const Icon(Icons.clear),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
