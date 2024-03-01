import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/store/store_bloc.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/domain/use_case/currency/currencies_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/foundation.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class CurrenciesView extends StatefulWidget {
  const CurrenciesView({super.key});

  @override
  State<CurrenciesView> createState() => _CurrenciesViewState();
}

class _CurrenciesViewState extends State<CurrenciesView> {
  late List<Currency> currencies;
  late Currency? defaultStoreCurrency;
  @override
  void initState() {
    currencies = List<Currency>.from(context
            .read<StoreBloc>()
            .state
            .mapOrNull(loaded: (_) => _.store.currencies) ??
        []);
    defaultStoreCurrency = context
        .read<StoreBloc>()
        .state
        .mapOrNull(loaded: (_) => _.store.defaultCurrency);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return BlocConsumer<StoreBloc, StoreState>(
      listener: (context, state) {
        state.mapOrNull(
          loading: (_) => loading(status: 'Loading Store Info'),
          loaded: (_) {
            dismissLoading();
            context.popRoute();
          },
          error: (_) {
            dismissLoading();
            context.showSnackBar(_.failure.toSnackBarString());
          },
        );
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: context.defaultSystemUiOverlayStyle,
              title: const Text('Currencies'),
              actions: [
                TextButton(
                    onPressed: () async {
                      final sameCurrencies = listEquals(
                          currencies.map((e) => e.code).toList(),
                          state
                              .mapOrNull(loaded: (_) => _.store.currencies)
                              ?.map((e) => e.code)
                              .toList());
                      if (sameCurrencies &&
                          defaultStoreCurrency?.code ==
                              state
                                  .mapOrNull(
                                      loaded: (_) => _.store.defaultCurrency)
                                  ?.code) {
                        context.popRoute();
                        return;
                      }
                      List<String> currenciesIsoCode = [];
                      for (var currency in currencies) {
                        currenciesIsoCode.add(currency.code!);
                      }
                      context.read<StoreBloc>().add(StoreEvent.updateStore(
                          StorePostReq(
                              defaultCurrencyCode: defaultStoreCurrency?.code,
                              currencies: currenciesIsoCode)));
                    },
                    child: const Text('Save')),
              ],
            ),
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(12.0),
                children: [
                  Text('Manage the markets that you will operate within.',
                      style: mediumTextStyle!.copyWith(color: manatee)),
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
                            style: mediumTextStyle.copyWith(color: manatee)),
                        space,
                        if (currencies.length == 1)
                          Text(currencies.first.name ?? ''),
                        if (currencies.length > 1)
                          DropdownButtonFormField<String>(
                            value: defaultStoreCurrency?.code,
                            style: context.bodyMedium,
                            items: currencies
                                .map((currency) => DropdownMenuItem(
                                      value: currency.code,
                                      child: Text(currency.name ?? ''),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                defaultStoreCurrency = currencies
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
                                          color: manatee)),
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
                                    backgroundColor:
                                        context.theme.scaffoldBackgroundColor,
                                    builder: (context) => AllCurrenciesView(
                                        storeCurrencies: currencies),
                                  );
                                  if (result != null) {
                                    currencies = result;
                                    if (!currencies.any((element) =>
                                        element == defaultStoreCurrency)) {
                                      defaultStoreCurrency = result.first;
                                    }
                                    setState(() {});
                                  }
                                },
                                child: const Text('Edit'))
                          ],
                        ),
                        space,
                        if (currencies.isNotEmpty)
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final currency = currencies[index];
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
                              itemCount: currencies.length),
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
                    itemBuilder: (context, currency, index) => CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(currency.name ?? ''),
                      secondary: Text(
                          NumberFormat.simpleCurrency(
                                  name: currency.code?.toUpperCase())
                              .currencySymbol,
                          style: context.bodyMediumW600),
                      onChanged: (bool? value) {
                        var selectedCurrencies = controller.selectedCurrencies;
                        if (selectedCurrencies
                            .any((element) => element.code == currency.code)) {
                          selectedCurrencies.removeWhere(
                              (element) => element.code == currency.code);
                        } else {
                          selectedCurrencies.add(currency);
                        }
                        controller.update();
                      },
                      value: controller.selectedCurrencies
                          .any((element) => element.code == currency.code),
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
