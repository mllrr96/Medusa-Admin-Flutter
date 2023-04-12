import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import '../../../../../../data/models/store/index.dart';
import '../../../../../../data/repository/sales_channel/sales_channel_repo.dart';

class SalesChannelDetailsController extends GetxController {
  SalesChannelDetailsController({required this.salesChannelRepo, required this.productsRepo});
  final SalesChannelRepo salesChannelRepo;
  final ProductsRepo productsRepo;
  final SalesChannel salesChannel = Get.arguments;
  final pagingController = PagingController<int, Product>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  bool selectAll = false;
  List<String> selectedProducts = [];
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await productsRepo.retrieveAll(
      queryParams: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        'sales_channel_id': [salesChannel.id!, ''],
        'expand': 'collection,type,sales_channels',
        'fields': 'id,title,thumbnail,status',
      },
    );

    result.when((success) {
      final isLastPage = success.products!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.products!);
      } else {
        final nextPageKey = pageKey + success.products!.length;
        pagingController.appendPage(success.products!, nextPageKey);
      }
      update();
    }, (error) {
      pagingController.error = error.message;
    });
  }

  Future<void> removeProducts({String? id}) async {
    loading();
    final result = await salesChannelRepo.removeProductsFromSalesChannel(
        id: salesChannel.id!, productIds: id != null ? <String>[id] : selectedProducts);
    result.when((success) {
      pagingController.refresh();
      EasyLoading.showSuccess('Sales channel updated');
      if (id != null) {
        selectedProducts.remove(id);
        update();
      }
    }, (error) {
      Get.snackbar('Product removal failed ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
      dismissLoading();
    });
  }
}
