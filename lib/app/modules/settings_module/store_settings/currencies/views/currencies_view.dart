import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:medusa_admin/domain/use_case/currencies_use_case.dart';
import 'package:medusa_admin/domain/use_case/update_store_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../core/utils/colors.dart';
import '../controllers/currencies_controller.dart';

@RoutePage()
class CurrenciesView extends StatelessWidget {
  const CurrenciesView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return GetBuilder<CurrenciesController>(
      init:
          CurrenciesController(updateStoreUseCase: UpdateStoreUseCase.instance),
      builder: (controller) {
        return GestureDetector(
          onTap: () => context.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Currencies'),
              actions: [
                TextButton(
                    onPressed: () async =>
                        await controller.updateStore(context),
                    child: const Text('Save')),
              ],
            ),
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(12.0),
                children: [
                  Text('Manage the markets that you will operate within.',
                      style: mediumTextStyle!.copyWith(color: lightWhite)),
                  space,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      color: context.theme.cardColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Default store currency', style: largeTextStyle),
                        Text('This is the currency your prices are shown in.',
                            style: mediumTextStyle.copyWith(color: lightWhite)),
                        space,
                        if (controller.currencies.isNotEmpty &&
                            controller.currencies.length == 1)
                          Text(controller.currencies.first.name ?? ''),
                        if (controller.currencies.isNotEmpty &&
                            controller.currencies.length > 1)
                          DropdownButtonFormField<String>(
                            value: controller.defaultStoreCurrency?.code,
                            style: context.bodyMedium,
                            items: controller.currencies
                                .map((currency) => DropdownMenuItem(
                                      value: currency.code,
                                      child: Text(currency.name ?? ''),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                controller.defaultStoreCurrency = controller
                                    .currencies
                                    .where((element) => element.code == value)
                                    .first;
                              }
                            },
                            decoration: InputDecoration(
                              fillColor: context.theme.scaffoldBackgroundColor,
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        const SizedBox(height: 6.0),
                      ],
                    ),
                  ),
                  space,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      color: context.theme.expansionTileTheme.backgroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Store currencies',
                                      style: largeTextStyle),
                                  Text(
                                      'All the currencies available in your store.',
                                      style: mediumTextStyle.copyWith(
                                          color: lightWhite)),
                                ],
                              ),
                            ),
                            TextButton(
                                onPressed: () async {
                                  List<Currency>? result =
                                      await showBarModalBottomSheet(
                                    expand: true,
                                    context: context,
                                    overlayStyle: context
                                        .theme.appBarTheme.systemOverlayStyle,
                                        backgroundColor: context.theme.scaffoldBackgroundColor,
                                        builder: (context) => AllCurrenciesView(
                                        storeCurrencies: controller.currencies),
                                  );
                                  if (result != null) {
                                    controller.currencies = result;
                                    if (!controller.currencies.any((element) =>
                                        element ==
                                        controller.defaultStoreCurrency)) {
                                      controller.defaultStoreCurrency =
                                          result.first;
                                    }
                                    controller.update();
                                  }
                                },
                                child: const Text('Edit'))
                          ],
                        ),
                        space,
                        if (controller.currencies.isNotEmpty)
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final currency = controller.currencies[index];
                                return ListTile(
                                  title: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(NumberFormat.simpleCurrency(
                                              name:
                                                  currency.code?.toUpperCase())
                                          .currencySymbol),
                                      const SizedBox(width: 12.0),
                                      Text(currency.name ?? ''),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (_, __) => const Divider(),

                              itemCount: controller.currencies.length),
                        const SizedBox(height: 6.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AllCurrenciesView extends StatelessWidget {
  const AllCurrenciesView({super.key, required this.storeCurrencies});
  final List<Currency> storeCurrencies;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllCurrenciesController>(
      init: AllCurrenciesController(
          currenciesUseCase: CurrenciesUseCase.instance,
          storeCurrencies: storeCurrencies),
      builder: (controller) {
        return GestureDetector(
          onTap: () => context.unfocus(),
          child: Material(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Add Store Currencies'),
                actions: [
                  if (controller.selectedCurrencies.isNotEmpty)
                    TextButton(
                        onPressed: () =>
                            context.popRoute(controller.selectedCurrencies),
                        child: const Text('Save')),
                ],
              ),
              body: SafeArea(
                child: PagedListView.separated(
                  padding: const EdgeInsets.all(12.0),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Currency>(
                      itemBuilder: (context, currency, index) =>
                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: Text(currency.name ?? ''),
                            secondary: Text(
                                NumberFormat.simpleCurrency(
                                        name: currency.code?.toUpperCase())
                                    .currencySymbol,
                                style: context.bodyMediumW600),
                            onChanged: (bool? value) {
                              var selectedCurrencies =
                                  controller.selectedCurrencies;
                              if (selectedCurrencies.any(
                                  (element) => element.code == currency.code)) {
                                selectedCurrencies.removeWhere(
                                    (element) => element.code == currency.code);
                              } else {
                                selectedCurrencies.add(currency);
                              }
                              controller.update();
                            },
                            value: controller.selectedCurrencies.any(
                                (element) => element.code == currency.code),
                          ),
                      firstPageProgressIndicatorBuilder: (context) =>
                          const Center(
                              child: CircularProgressIndicator.adaptive()),
                    firstPageErrorIndicatorBuilder: (_) => PaginationErrorPage(
                        pagingController: controller.pagingController),
                  ),
                  separatorBuilder: (_, __) => const Divider(height: 0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AllCurrenciesController extends GetxController {
  AllCurrenciesController(
      {required this.currenciesUseCase, required this.storeCurrencies});

  final CurrenciesUseCase currenciesUseCase;
  final List<Currency> storeCurrencies;
  final PagingController<int, Currency> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  List<Currency> selectedCurrencies = [];

  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) {
      debugPrint('Getting data');
      _fetchPage(pageKey);
    });
    selectedCurrencies.addAll(storeCurrencies);
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await currenciesUseCase(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
    });
    result.when((success) {
      final isLastPage = success.currencies!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.currencies!);
      } else {
        final nextPageKey = pageKey + success.currencies!.length;
        pagingController.appendPage(success.currencies!, nextPageKey);
      }
    }, (error) => pagingController.error = error);
  }
}
