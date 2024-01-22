import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/sales_channel/sales_channels_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SalesChannelsController extends GetxController {
  SalesChannelsController({required this.salesChannelsUseCase});
  final SalesChannelsUseCase salesChannelsUseCase;
  static SalesChannelsController get instance =>
      Get.find<SalesChannelsController>();

  final pagingController = PagingController<int, SalesChannel>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
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
    final result = await salesChannelsUseCase(
      queryParameters: {
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
      pagingController.error = error;
      refreshController.refreshFailed();
    });
  }
}
