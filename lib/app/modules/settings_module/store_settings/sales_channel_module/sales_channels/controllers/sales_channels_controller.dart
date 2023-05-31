import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/sales_channel/sales_channel_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SalesChannelsController extends GetxController {
  SalesChannelsController({required this.salesChannelRepo});
  final SalesChannelRepo salesChannelRepo;
  static SalesChannelsController get instance => Get.find<SalesChannelsController>();

  final pagingController = PagingController<int, SalesChannel>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final refreshController = RefreshController();

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }


  Future<void> _fetchPage(int pageKey) async {
    final result = await salesChannelRepo.retrieveAll(
      queryParams: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );

    result.when((success) {
      final isLastPage = success.salesChannels!.length < _pageSize;
      refreshController.refreshCompleted();
      if (isLastPage) {
        pagingController.appendLastPage(success.salesChannels!);
      } else {
        final nextPageKey = pageKey + success.salesChannels!.length;
        pagingController.appendPage(success.salesChannels!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
      refreshController.refreshFailed();
    });
  }
}
