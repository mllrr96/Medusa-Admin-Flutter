import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:info_popup/info_popup.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';
import 'package:medusa_admin/app/data/repository/tax_rate/tax_rate_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../components/adaptive_back_button.dart';
import '../../add_update_tax_rate/controllers/add_update_tax_rate_controller.dart';
import '../components/tax_rate_card.dart';
import '../controllers/tax_settings_controller.dart';

@RoutePage()
class TaxSettingsView extends StatelessWidget {
  const TaxSettingsView(this.region, {super.key});
  final Region region;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return GetBuilder<TaxSettingsController>(
      init: TaxSettingsController(
          region: region,
          storeRepo: StoreRepo(),
          taxRateRepo: TaxRateRepo(),),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveBackButton(),
            title: Text(controller.region.name ?? ''),
            actions: [
              AdaptiveButton(
                  onPressed: () async {
                    final result =
                        await context.pushRoute(AddUpdateTaxRateRoute(
                      addUpdateTaxRateReq:
                          AddUpdateTaxRateReq(regionId: controller.region.id!),
                    ));
                    if (result is bool) {
                      controller.pagingController.refresh();
                    }
                  },
                  child: const Text('New Tax Rate'))
            ],
          ),
          bottomNavigationBar: Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewPadding.bottom,
                right: 18.0,
                left: 18.0,
                top: MediaQuery.of(context).viewPadding.bottom / 2),
            child: FilledButton(
              onPressed: controller.same() ? null : () {},
              child: Text('Save',
                  style: TextStyle(
                      color: controller.same() ? Colors.grey : Colors.white)),
            ),
          ),
          body: SafeArea(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Details', style: context.headlineMedium),
                      halfSpace,
                      Text('Tax rates',
                          style: mediumTextStyle?.copyWith(color: lightWhite)),
                      PagedListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 6.0),
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        pagingController: controller.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<TaxRate>(
                            itemBuilder: (context, taxRate, index) =>
                                TaxRateCard(
                                  taxRate: taxRate,
                                  onEditTap: () async {
                                    final result = await context
                                        .pushRoute(AddUpdateTaxRateRoute(
                                      addUpdateTaxRateReq: AddUpdateTaxRateReq(
                                          regionId: controller.region.id!,
                                          taxRate: taxRate),
                                    ));
                                    if (result is bool) {
                                      controller.pagingController.refresh();
                                    }
                                  },
                                  onDeleteTap: () async => await controller
                                      .deleteTaxRate(taxRate.id!, context),
                                ),
                            firstPageProgressIndicatorBuilder: (context) =>
                                const Center(
                                    child:
                                        CircularProgressIndicator.adaptive()),
                            noItemsFoundIndicatorBuilder: (_) => TaxRateCard(
                                taxRate: TaxRate(
                                    name: 'Default', rate: 0.0, code: '-'))),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tax Calculation Settings', style: largeTextStyle),
                      space,
                      Text('Tax Provider',
                          style: mediumTextStyle?.copyWith(color: lightWhite)),
                      halfSpace,
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: controller.taxProviders != null
                            ? DropdownButtonFormField<TaxProvider>(
                                style: context.bodyMedium,
                                items: controller.taxProviders!
                                    .map((e) => DropdownMenuItem<TaxProvider>(
                                          value: e,
                                          child: Text(e.id ?? ''),
                                        ))
                                    .toList(),
                                onChanged: (val) {},
                                value: controller.selectedTaxProvider,
                                decoration: const InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0)))),
                              )
                            : const Center(
                                child: CircularProgressIndicator.adaptive()),
                      ),
                      space,
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        value: controller.automaticTaxes,
                        onChanged: (val) {
                          if (val != null) {
                            controller.automaticTaxes = val;
                            controller.update();
                          }
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text('Calculate taxes automatically?'),
                        secondary: InfoPopupWidget(
                          arrowTheme: InfoPopupArrowTheme(
                            arrowDirection: ArrowDirection.up,
                            color: ColorManager.primary,
                          ),
                          contentTheme: InfoPopupContentTheme(
                            infoContainerBackgroundColor:
                                Theme.of(context).appBarTheme.backgroundColor!,
                            infoTextStyle: smallTextStyle!,
                            contentPadding: const EdgeInsets.all(8),
                            contentBorderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            infoTextAlign: TextAlign.start,
                          ),
                          contentTitle:
                              'When checked Medusa will automatically apply tax calculations to Carts in this Region. When unchecked you will have to manually compute taxes at checkout. Manual taxes are recommended if using a 3rd party tax provider to avoid performing too many requests',
                          child: const Icon(Icons.info_outline),
                        ),
                      ),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        value: controller.giftCardsTaxable,
                        onChanged: (val) {
                          if (val != null) {
                            controller.giftCardsTaxable = val;
                            controller.update();
                          }
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text('Apply tax to gift cards?'),
                        secondary: InfoPopupWidget(
                          arrowTheme: InfoPopupArrowTheme(
                            arrowDirection: ArrowDirection.up,
                            color: ColorManager.primary,
                          ),
                          contentTheme: InfoPopupContentTheme(
                            infoContainerBackgroundColor:
                                Theme.of(context).appBarTheme.backgroundColor!,
                            infoTextStyle: smallTextStyle,
                            contentPadding: const EdgeInsets.all(8),
                            contentBorderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            infoTextAlign: TextAlign.start,
                          ),
                          contentTitle:
                              'When checked taxes will be applied to gift cards on checkout. In some contries tax regulations require that taxes are applied to gift cards on purchase.',
                          child: const Icon(Icons.info_outline),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
