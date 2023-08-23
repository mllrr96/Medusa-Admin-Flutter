import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../data/models/store/region.dart';
import '../../../../../../data/repository/regions/regions_repo.dart';


class TaxSettingsSelectRegionController extends GetxController {
  TaxSettingsSelectRegionController({required this.regionsRepo});
  final RegionsRepo regionsRepo;

  final pagingController = PagingController<int, Region>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final refreshController = RefreshController();

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await regionsRepo.retrieveAll(
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
