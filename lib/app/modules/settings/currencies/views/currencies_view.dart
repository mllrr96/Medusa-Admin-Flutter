import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/currency.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../data/repository/currency/currency_repo.dart';
import '../controllers/currencies_controller.dart';

class CurrenciesView extends GetView<CurrenciesController> {
  const CurrenciesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final store = StoreService.store;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Currencies'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(12.0),
            children: [
              Text('Manage the markets that you will operate within.',
                  style: mediumTextStyle!.copyWith(color: lightWhite)),
              space,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  color: Theme.of(context).expansionTileTheme.backgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Default store currency', style: largeTextStyle),
                    Text('This is the currency your prices are shown in.',
                        style: mediumTextStyle.copyWith(color: lightWhite)),
                    space,
                    if (store.currencies != null)
                      DropdownButtonFormField<String>(
                        value: store.defaultCurrencyCode,
                        items: store.currencies!
                            .map((currency) => DropdownMenuItem(
                                  value: currency.code,
                                  child: Text(currency.name ?? ''),
                                ))
                            .toList(),
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          ),
                        ),
                      ),
                    const SizedBox(height: 6.0),
                  ],
                ),
              ),
              space,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  color: Theme.of(context).expansionTileTheme.backgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Store currencies', style: largeTextStyle),
                            Text('All the currencies available in your store.',
                                style: mediumTextStyle.copyWith(color: lightWhite)),
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                              await showCupertinoModalBottomSheet(
                                expand: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => AllCurrenciesView(),
                              );
                            },
                            icon: Icon(Icons.add, color: ColorManager.primary))
                      ],
                    ),
                    space,
                    if (store.currencies != null)
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final currency = store.currencies![index];
                            return ListTile(
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(currency.code?.toUpperCase() ?? ''),
                                  const SizedBox(width: 12.0),
                                  Text(currency.name ?? ''),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.delete_forever, color: Colors.red)),
                            );
                          },
                          separatorBuilder: (_, __) => Divider(),
                          itemCount: store.currencies!.length),
                    const SizedBox(height: 6.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllCurrenciesView extends StatelessWidget {
  const AllCurrenciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllCurrenciesController>(
      init: AllCurrenciesController(currencyRepo: CurrencyRepo()),
      builder: (controller) {
        return Material(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Add Store Currencies'),
              actions: [
                if (GetPlatform.isIOS) CupertinoButton(onPressed: () {}, child: const Text('Save')),
                if (GetPlatform.isAndroid) TextButton(onPressed: () {}, child: const Text('Save')),
              ],
            ),
            body: SafeArea(
              child: PagedListView.separated(
                padding: const EdgeInsets.all(12.0),
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Currency>(
                    itemBuilder: (context, currency, index) => ListTile(
                        selected:
                            StoreService.store.currencies?.any((element) => element.code == currency.code) ?? false,
                        title: Text(currency.name ?? '')),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(child: CircularProgressIndicator.adaptive())),
                separatorBuilder: (_, __) => const SizedBox(height: 12.0),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AllCurrenciesController extends GetxController {
  AllCurrenciesController({required this.currencyRepo});
  final CurrencyRepo currencyRepo;
  final PagingController<int, Currency> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) {
      print('Getting data');
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await currencyRepo.retrieve(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
    });
    result.fold(
      (l) {
        final isLastPage = l.currencies!.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(l.currencies!);
        } else {
          final nextPageKey = pageKey + l.currencies!.length;
          pagingController.appendPage(l.currencies!, nextPageKey);
        }
      },
      (r) {
        pagingController.error = 'Error loading orders';
      },
    );
  }
}
