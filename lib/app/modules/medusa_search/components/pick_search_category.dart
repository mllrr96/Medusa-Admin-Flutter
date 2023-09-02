import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/medusa_search/components/search_chip.dart';

import '../../../../core/utils/enums.dart';
import '../../components/adaptive_close_button.dart';

class PickSearchCategory extends StatelessWidget {
  const PickSearchCategory({
    super.key,
    required this.selectedSearchCategory,
  });
  final SearchCategory selectedSearchCategory;

  @override
  Widget build(BuildContext context) {
    final bottomPadding =
        MediaQuery.of(context).viewPadding.bottom == 0 ? 20.0 : MediaQuery.of(context).viewPadding.bottom;
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            leading: const AdaptiveCloseButton(),
            title: const Text('Search for'),
          ),
          const SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              children: SearchCategory.values
                  .map((e) => GestureDetector(
                        onTap: () => Get.back(result: e),
                        child: SearchChip(
                          searchableField: e,
                          selected: e == selectedSearchCategory,
                        ),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(height: bottomPadding)
        ],
      ),
    );
  }
}
