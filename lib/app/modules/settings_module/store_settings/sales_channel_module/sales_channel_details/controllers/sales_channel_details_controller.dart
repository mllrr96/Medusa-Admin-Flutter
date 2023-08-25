import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/products_module/products/components/index.dart';
import 'package:medusa_admin/app/modules/settings_module/store_settings/sales_channel_module/sales_channels/controllers/sales_channels_controller.dart';
import '../../../../../../data/models/store/index.dart';
import '../../../../../../data/repository/collection/collection_repo.dart';
import '../../../../../../data/repository/product_tag/product_tag_repo.dart';
import '../../../../../../data/repository/sales_channel/sales_channel_repo.dart';

class SalesChannelDetailsController extends GetxController {
  SalesChannelDetailsController(
      {required this.salesChannelRepo,
      required this.productsRepo,
      required this.collectionRepo,
      required this.productTagRepo});
  final SalesChannelRepo salesChannelRepo;
  final ProductsRepo productsRepo;
  SalesChannel salesChannel = Get.arguments;
  final pagingController = PagingController<int, Product>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final CollectionRepo collectionRepo;
  final ProductTagRepo productTagRepo;
  bool selectAll = false;
  List<String> selectedProducts = [];
  List<ProductCollection>? collections;
  List<ProductTag>? tags;
  ProductFilter? productFilter;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    Map<String, dynamic> queryParameters = {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'sales_channel_id': [salesChannel.id!, ''],
      'expand': 'collection,type,sales_channels',
      'fields': 'id,title,thumbnail,status',
    };

    if (productFilter != null) {
      queryParameters.addAll(productFilter!.toJson());
    }

    final result =
        await productsRepo.retrieveAll(queryParameters: queryParameters);

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
  void resetFilter() {
    if (productFilter == null || productFilter?.count() == 0) {
      return;
    }
    productFilter = null;
    pagingController.refresh();
    update();
  }
  Future<void> removeProducts({String? id}) async {
    loading();
    final result = await salesChannelRepo.removeProductsFromSalesChannel(
        id: salesChannel.id!,
        productIds: id != null ? <String>[id] : selectedProducts);
    result.when((success) {
      pagingController.refresh();
      EasyLoading.showSuccess('Sales channel updated');
      if (id != null) {
        selectedProducts.remove(id);
      } else {
        selectedProducts
            .removeWhere((element) => selectedProducts.contains(element));
      }
      update();
    }, (error) {
      Get.snackbar('Product removal failed ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM);
      dismissLoading();
    });
  }

  Future<void> addProducts(List<String> ids) async {
    loading();
    final result = await salesChannelRepo.addProductsToSalesChannel(
        id: salesChannel.id!, productIds: ids);
    result.when((success) {
      pagingController.refresh();
      EasyLoading.showSuccess('Sales channel updated');
    }, (error) {
      Get.snackbar('Product removal failed ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM);
      dismissLoading();
    });
  }

  Future<void> deleteChannel() async {
    loading();
    final result = await salesChannelRepo.delete(id: salesChannel.id!);
    result.when((success) {
      EasyLoading.showSuccess('Sales channel deleted');
      SalesChannelsController.instance.pagingController.refresh();
    }, (error) {
      Get.snackbar('Deletion failed ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM);
      dismissLoading();
    });
  }
}
