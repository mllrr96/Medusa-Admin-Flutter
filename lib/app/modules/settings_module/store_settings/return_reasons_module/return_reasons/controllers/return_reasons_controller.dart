import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/return_reasons_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReturnReasonsController extends GetxController {
  ReturnReasonsController({required this.returnReasonsUseCase});
  final ReturnReasonsUseCase returnReasonsUseCase;
  final PagingController<int, ReturnReason> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  RefreshController refreshController = RefreshController();
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await returnReasonsUseCase.fetchReturnReasons(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );
    result.when((success) {
      final isLastPage = success.returnReasons!.length < _pageSize;
      refreshController.refreshCompleted();
      if (isLastPage) {
        pagingController.appendLastPage(success.returnReasons!);
      } else {
        final nextPageKey = pageKey + success.returnReasons!.length;
        pagingController.appendPage(success.returnReasons!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
      refreshController.refreshFailed();
    });
  }

  Future<void> deleteReturnReason(String id) async {
    loading();
    final result = await returnReasonsUseCase.deleteReturnReason(id);
    result.when((success) {
      EasyLoading.showSuccess('Deleted');
      pagingController.refresh();
    }, (error) => EasyLoading.showError('Error deleting'));
  }
}
