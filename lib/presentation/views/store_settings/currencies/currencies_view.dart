import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/presentation/blocs/store/store_bloc.dart';
import 'package:medusa_admin/presentation/cubits/currencies/currencies_cubit.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class CurrenciesView extends StatefulWidget {
  const CurrenciesView({super.key});

  @override
  State<CurrenciesView> createState() => _CurrenciesViewState();
}

class _CurrenciesViewState extends State<CurrenciesView> {
  late List<Currency> currencies;
  late Currency? defaultStoreCurrency;
  late StoreBloc storeBloc;
  Store? store;
  @override
  void initState() {
    storeBloc = StoreBloc.instance;
    store = context
        .read<StoreBloc>()
        .state
        .maybeMap(loaded: (value) => value.store, orElse: () => null);
    if (store == null) {
      context.read<StoreBloc>().add(const StoreEvent.loadStore());
      context.maybePop();
    }
    currencies = store?.currencies ?? [];
    defaultStoreCurrency = store?.defaultCurrency;
    super.initState();
  }

  @override
  void dispose() {
    storeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return BlocConsumer<StoreBloc, StoreState>(
      bloc: storeBloc,
      listener: (context, state) {
        state.maybeMap(
          loading: (_) => loading(),
          loaded: (_) {
            dismissLoading();
            context.read<StoreBloc>().add(const StoreEvent.loadStore());
            context.maybePop();
          },
          error: (_) {
            dismissLoading();
            context.showSnackBar(_.failure.toSnackBarString());
          },
          orElse: () => dismissLoading(),
        );
      },
      builder: (context, state) {
        return HideKeyboard(
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: context.defaultSystemUiOverlayStyle,
              title: const Text('Currencies'),
              actions: [
                ShadButton.ghost(
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
                        context.maybePop();
                        return;
                      }
                      List<String> currenciesIsoCode = [];
                      for (var currency in currencies) {
                        currenciesIsoCode.add(currency.code!);
                      }
                      storeBloc.add(StoreEvent.updateStore(StorePostReq(
                          defaultCurrencyCode: defaultStoreCurrency?.code,
                          currencies: currenciesIsoCode)));
                    },
                    text: const Text('Save')),
              ],
            ),
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(12.0),
                children: [
                  Text('Manage the markets that you will operate within.',
                      style: mediumTextStyle!.copyWith(color: manatee)),
                  space,
                  ShadCard(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Default store currency', style: largeTextStyle),
                        Text('This is the currency your prices are shown in.',
                            style: mediumTextStyle.copyWith(color: manatee)),
                        space,
                        if (currencies.length == 1)
                          Text(currencies.first.name ?? ''),
                        if (currencies.length > 1)
                        Center(
                          child: ShadSelect<String>(
                            onChanged: (value) {
                              setState(() {
                                defaultStoreCurrency = currencies
                                    .where((element) => element.code == value)
                                    .first;
                              });
                            },
                            initialValue: defaultStoreCurrency?.code,
                            options: currencies
                                .map((currency) => ShadOption<String>(
                                      value: currency.code!,
                                      child: Text(currency.name ?? ''),
                                    ))
                                .toList(),
                            selectedOptionBuilder: (context, value) {
                              final currency = currencies
                                  .where((element) => element.code == value)
                                  .first;
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(currency.code.getCurrencySymbol),
                                  const SizedBox(width: 12.0),
                                  Text(currency.name ?? ''),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 6.0),
                      ],
                    ),
                  ),
                  space,
                  ShadCard(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    // decoration: BoxDecoration(
                    //   borderRadius:
                    //       const BorderRadius.all(Radius.circular(12.0)),
                    //   color: context.theme.expansionTileTheme.backgroundColor,
                    // ),
                    content: Column(
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
                            ShadButton.ghost(
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
                                text: const Text('Edit'))
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
                                      Text(currency.code.getCurrencySymbol),
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

class AllCurrenciesView extends StatefulWidget {
  const AllCurrenciesView({super.key, required this.storeCurrencies});
  final List<Currency> storeCurrencies;

  @override
  State<AllCurrenciesView> createState() => _AllCurrenciesViewState();
}

class _AllCurrenciesViewState extends State<AllCurrenciesView> {
  late CurrenciesCubit currenciesCubit;
  final PagingController<int, Currency> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  List<Currency> selectedCurrencies = [];

  void _loadPage(int pageKey) {
    currenciesCubit.loadAll(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
    });
  }

  @override
  void initState() {
    currenciesCubit = CurrenciesCubit.instance;
    pagingController.addPageRequestListener(_loadPage);
    selectedCurrencies.addAll(widget.storeCurrencies);
    super.initState();
  }

  @override
  void dispose() {
    currenciesCubit.close();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CurrenciesCubit, CurrenciesState>(
      bloc: currenciesCubit,
      listener: (context, state) {
        state.maybeWhen(
          currencies: (currencies, count) {
            final isLastPage = currencies.length < CurrenciesCubit.pageSize;
            if (isLastPage) {
              pagingController.appendLastPage(currencies);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + currencies.length;
              pagingController.appendPage(currencies, nextPageKey);
            }
          },
          error: (failure) {
            pagingController.error = failure;
          },
          orElse: () {},
        );
      },
      child: HideKeyboard(
        child: Material(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Add Store Currencies'),
              actions: [
                if (selectedCurrencies.isNotEmpty)
                  TextButton(
                      onPressed: () => context.maybePop(selectedCurrencies),
                      child: const Text('Save')),
              ],
            ),
            body: SafeArea(
              child: PagedListView.separated(
                padding: const EdgeInsets.all(12.0),
                pagingController: pagingController,
                builderDelegate: PagedChildBuilderDelegate<Currency>(
                  animateTransitions: true,
                  itemBuilder: (context, currency, index) => CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(currency.name ?? ''),
                    secondary: Text(currency.code.getCurrencySymbol,
                        style: context.bodyMediumW600),
                    onChanged: (value) {
                      if (selectedCurrencies
                          .any((element) => element.code == currency.code)) {
                        selectedCurrencies.removeWhere(
                            (element) => element.code == currency.code);
                      } else {
                        selectedCurrencies.add(currency);
                      }
                      setState(() {});
                    },
                    value: selectedCurrencies
                        .any((element) => element.code == currency.code),
                  ),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  firstPageErrorIndicatorBuilder: (_) =>
                      PaginationErrorPage(pagingController: pagingController),
                ),
                separatorBuilder: (_, __) => const Divider(height: 0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
