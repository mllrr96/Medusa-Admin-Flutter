import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/tax_settings_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';

class TaxSettingsController extends GetxController {
  TaxSettingsController(
      {required this.taxSettingsUseCase, required this.region});
  final TaxSettingsUseCase taxSettingsUseCase;
  final pagingController = PagingController<int, TaxRate>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  bool automaticTaxes = false;
  bool showAutomaticTaxesHint = false;
  bool giftCardsTaxable = false;
  bool showGiftCardsTaxableHint = false;
  TaxProvider? selectedTaxProvider;
  final Region region;
  List<TaxProvider>? taxProviders;
  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    automaticTaxes = region.automaticTaxes ?? false;
    giftCardsTaxable = region.giftCardsTaxable ?? false;
    update();
    await loadTaxProviders();
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await taxSettingsUseCase.fetchTaxRates(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        'region_id': region.id!,
      },
    );

    result.when((success) {
      final isLastPage = success.taxRates!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.taxRates!);
      } else {
        final nextPageKey = pageKey + success.taxRates!.length;
        pagingController.appendPage(success.taxRates!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error;
    });
  }

  Future<void> loadTaxProviders() async {
    final result = await taxSettingsUseCase.fetchTaxProviders();
    result.when((taxProviders) {
      if (taxProviders.isNotEmpty) {
        this.taxProviders = taxProviders;
        update();
      } else {
        this.taxProviders = [const TaxProvider(id: 'System Tax Provider')];
        selectedTaxProvider = this.taxProviders?.first;
        update();
      }
    }, (error) {
      EasyLoading.showError(error.message);
    });
  }

  Future<void> deleteTaxRate(String id, BuildContext context) async {
    loading();
    final result = await taxSettingsUseCase.deleteTaxRate(id);
    result.when((success) {
      EasyLoading.showSuccess('Tax rate deleted');
      pagingController.refresh();
      dismissLoading();
    }, (error) {
      context.showSnackBar(error.toSnackBarString());
      dismissLoading();
    });
  }

  bool same() {
    if (automaticTaxes == region.automaticTaxes &&
        giftCardsTaxable == region.giftCardsTaxable) {
      return true;
    }
    return false;
  }
}
