import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RegionsController extends GetxController {
  RegionsController({required this.regionsRepo});
  final RegionsRepo regionsRepo;

  final PagingController<int, Region> pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  RefreshController refreshController = RefreshController();

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
      queryParams: {
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
      pagingController.error = error.getMessage();
      refreshController.refreshFailed();
    });
  }
}
