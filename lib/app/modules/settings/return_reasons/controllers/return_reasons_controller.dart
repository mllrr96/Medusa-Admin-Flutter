import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/return_reason/return_reason_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReturnReasonsController extends GetxController {
  ReturnReasonsController({required this.returnReasonRepo});
  final ReturnReasonRepo returnReasonRepo;
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
    final result = await returnReasonRepo.retrieveAll(
      queryParams: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );
    result.fold((l) {
      final isLastPage = l.returnReasons!.length < _pageSize;
      refreshController.refreshCompleted();
      if (isLastPage) {
        pagingController.appendLastPage(l.returnReasons!);
      } else {
        final nextPageKey = pageKey + l.returnReasons!.length;
        pagingController.appendPage(l.returnReasons!, nextPageKey);
      }
    }, (r) {
      pagingController.error = r.getMessage();
      refreshController.refreshFailed();
    });
  }

  Future<void> deleteReturnReason(String id) async {
    loading();
    final result = await returnReasonRepo.delete(id: id);
    result.fold((l) {
      EasyLoading.showSuccess('Deleted');
      pagingController.refresh();
    }, (r) => EasyLoading.showError('Error deleting'));
  }
}
