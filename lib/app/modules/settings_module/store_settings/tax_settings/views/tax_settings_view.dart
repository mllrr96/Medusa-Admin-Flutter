import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';

import '../../../../components/adaptive_back_button.dart';
import '../controllers/tax_settings_controller.dart';

class TaxSettingsView extends GetView<TaxSettingsController> {
  const TaxSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Tax Settings'),
        actions: [AdaptiveButton(onPressed: () {}, child: Text('New Tax Rate'))],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Details', style: Theme.of(context).textTheme.displayLarge),
                  space,
                  PagedListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    pagingController: controller.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<TaxRate>(
                      itemBuilder: (context, taxRate, index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: const BorderRadius.all(Radius.circular(12.0))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(taxRate.name ?? ''),
                                AdaptiveIcon(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Code: ${taxRate.code ?? ''}', style: smallTextStyle?.copyWith(color: lightWhite)),
                                Text('${taxRate.rate?.toString() ?? ''} %', style: smallTextStyle),
                              ],
                            )
                          ],
                        ),
                      ),
                      firstPageProgressIndicatorBuilder: (context) =>
                          const Center(child: CircularProgressIndicator.adaptive()),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tax Calculation Settings', style: largeTextStyle),
                  space,
                  Text('Tax Provider', style: mediumTextStyle?.copyWith(color: lightWhite)),
                  halfSpace,
                  DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        child: Text('Test'),
                      ),
                    ],
                    onChanged: (val) {},
                    decoration: const InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))),
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: false,
                    onChanged: (val) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Calculate taxes automatically?'),
                    secondary: AdaptiveIcon(
                      onPressed: () {},
                      icon: const Icon(Icons.info_outline),
                    ),
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: false,
                    onChanged: (val) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Apply tax to gift cards?'),
                    secondary: AdaptiveIcon(
                      onPressed: () {},
                      icon: const Icon(Icons.info_outline),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
