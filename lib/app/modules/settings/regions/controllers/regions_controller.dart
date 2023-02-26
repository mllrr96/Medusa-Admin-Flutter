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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await regionsRepo.retrieveAll(
      queryParams: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );
    result.fold((l) {
      final isLastPage = l.regions!.length < _pageSize;
      refreshController.refreshCompleted();
      if (isLastPage) {
        pagingController.appendLastPage(l.regions!);
      } else {
        final nextPageKey = pageKey + l.regions!.length;
        pagingController.appendPage(l.regions!, nextPageKey);
      }
    }, (r) {
      pagingController.error = r.getMessage();
      refreshController.refreshFailed();
    });
  }
}
