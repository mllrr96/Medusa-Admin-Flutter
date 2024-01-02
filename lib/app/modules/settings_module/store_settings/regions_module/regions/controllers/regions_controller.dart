import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/regions_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RegionsController extends GetxController {
  static RegionsController get instance => Get.find<RegionsController>();
  RegionsController(this.regionsUseCase);
  final RegionsUseCase regionsUseCase;
  final PagingController<int, Region> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final refreshController = RefreshController();
  final scrollController = ScrollController();

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    // pagingController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  List<String> disabledCountriesIso2({Region? excludedRegion}) {
    List<String> result = [];
    pagingController.value.itemList?.forEach((region) {
      if (excludedRegion?.name == region.name) {
        return;
      }
      final countries = region.countries;
      if (countries != null) {
        for (var element in countries) {
          result.add(element.iso2 ?? '');
        }
      }
    });
    return result;
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await regionsUseCase(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );

    result.when((success) {
      final isLastPage = success.regions!.length < _pageSize;
      refreshController.refreshCompleted();
      if (isLastPage) {
        pagingController.appendLastPage(success.regions!);
      } else {
        final nextPageKey = pageKey + success.regions!.length;
        pagingController.appendPage(success.regions!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
      refreshController.refreshFailed();
    });
  }
}
