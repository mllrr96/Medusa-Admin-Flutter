import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/domain/use_case/tax_settings_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../add_update_tax_rate/controllers/add_update_tax_rate_controller.dart';
import '../components/tax_rate_card.dart';
import '../controllers/tax_settings_controller.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class TaxSettingsView extends StatelessWidget {
  const TaxSettingsView(this.region, {super.key});
  final Region region;

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return GetBuilder<TaxSettingsController>(
      init: TaxSettingsController(
        region: region,
        taxSettingsUseCase: TaxSettingsUseCase.instance,
      ),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.region.name ?? ''),
            actions: [
              TextButton(
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
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
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
                          style: mediumTextStyle?.copyWith(color: manatee)),
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
                            : const Skeletonizer(
                                enabled: true,
                                child: TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    hintText: 'System Tax Provider',
                                    isDense: true,
                                  ),
                                )),
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
                        secondary: IconButton(
                          iconSize: 20,
                          isSelected: controller.showAutomaticTaxesHint,
                          icon: const Icon(Icons.info_outlined),
                          selectedIcon: const Icon(Icons.info),
                          onPressed: () {
                            controller.showAutomaticTaxesHint =
                                !controller.showAutomaticTaxesHint;
                            controller.update();
                          },
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return SizeTransition(
                            sizeFactor: animation,
                            child: child,
                          );
                        },
                        child: controller.showAutomaticTaxesHint
                            ? Column(
                                children: [
                                  ListTile(
                                    tileColor:
                                        context.theme.dialogBackgroundColor,
                                    leading: const Icon(Icons.info),
                                    title: Text(
                                      'When checked Medusa will automatically apply tax calculations to Carts in this Region. When unchecked you will have to manually compute taxes at checkout. Manual taxes are recommended if using a 3rd party tax provider to avoid performing too many requests',
                                      style: context.bodySmall
                                          ?.copyWith(color: manatee),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              )
                            : const SizedBox.shrink(),
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
                        secondary: IconButton(
                          iconSize: 20,
                          isSelected: controller.showGiftCardsTaxableHint,
                          icon: const Icon(Icons.info_outlined),
                          selectedIcon: const Icon(Icons.info),
                          onPressed: () {
                            controller.showGiftCardsTaxableHint =
                                !controller.showGiftCardsTaxableHint;
                            controller.update();
                          },
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return SizeTransition(
                            sizeFactor: animation,
                            child: child,
                          );
                        },
                        child: controller.showGiftCardsTaxableHint
                            ? ListTile(
                                leading: const Icon(Icons.info),
                                title: Text(
                                  'When checked taxes will be applied to gift cards on checkout. In some countries tax regulations require that taxes are applied to gift cards on purchase.',
                                  style: context.bodySmall
                                      ?.copyWith(color: manatee),
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
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
                      Text('Tax rates: ',
                          style: mediumTextStyle?.copyWith(color: manatee)),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                sliver: PagedSliverList.separated(
                  separatorBuilder: (_, __) => const Gap(6.0),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<TaxRate>(
                    itemBuilder: (context, taxRate, index) => TaxRateCard(
                      taxRate: taxRate,
                      onEditTap: () async {
                        final result =
                            await context.pushRoute(AddUpdateTaxRateRoute(
                          addUpdateTaxRateReq: AddUpdateTaxRateReq(
                              regionId: controller.region.id!,
                              taxRate: taxRate),
                        ));
                        if (result is bool) {
                          controller.pagingController.refresh();
                        }
                      },
                      onDeleteTap: () async =>
                          await controller.deleteTaxRate(taxRate.id!, context),
                    ),
                    firstPageProgressIndicatorBuilder: (context) => const Column(
                      children: [
                        TaxRateCard(
                            taxRate:
                                TaxRate(name: 'Default', rate: 0.0, code: '-'),
                            shimmer: true),
                        Gap(6.0),
                        TaxRateCard(
                            taxRate:
                                TaxRate(name: 'Default', rate: 0.0, code: '-'),
                            shimmer: true),
                      ],
                    ),
                    firstPageErrorIndicatorBuilder: (_) => PaginationErrorPage(
                        pagingController: controller.pagingController),
                    noItemsFoundIndicatorBuilder: (_) => const Column(
                      children: [
                        TaxRateCard(
                            taxRate:
                                TaxRate(name: 'Default', rate: 0.0, code: '-')),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
