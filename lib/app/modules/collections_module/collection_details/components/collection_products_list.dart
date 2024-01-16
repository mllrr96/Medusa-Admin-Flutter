import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/components/pagination_error_page.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/domain/use_case/collection_details_use_case.dart';
import 'package:medusa_admin/domain/use_case/products_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class CollectionProductsList extends StatelessWidget {
  const CollectionProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionProductsController>(
      init: CollectionProductsController(
          productsUseCase: ProductsUseCase.instance,
          collectionDetailsUseCase: CollectionDetailsUseCase.instance),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: const Text('Products'),
            actions: [
              TextButton(
                  onPressed: controller.isEqual
                      ? null
                      : () {
                          controller.save(context);
                        },
                  child: const Text('Save'))
            ],
          ),
          body: SafeArea(
              child: PagedListView(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Product>(
              itemBuilder: (context, product, index) {
                return CheckboxListTile(
                  title: Text(product.title!),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _getStatusIcon(product.status),
                      const SizedBox(width: 4.0),
                      Text(
                          product.status.name.capitalize ?? product.status.name,
                          style: context.bodySmall),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  secondary: product.thumbnail != null
                      ? SizedBox(
                          width: 45,
                          child: CachedNetworkImage(
                            key: ValueKey(product.thumbnail!),
                            imageUrl: product.thumbnail!,
                            placeholder: (context, text) => const Center(
                                child: CircularProgressIndicator.adaptive()),
                            errorWidget: (context, string, error) => const Icon(
                                Icons.warning_rounded,
                                color: Colors.redAccent),
                          ))
                      : null,
                  value: controller.productsIds.contains(product.id),
                  selected: product.collectionId == controller.collectionId,
                  onChanged: (value) {
                    if (value != null && value) {
                      controller.productsIds.add(product.id!);
                    } else if (value != null && !value) {
                      controller.productsIds.remove(product.id!);
                    }
                    controller.update();
                  },
                );
              },
              firstPageProgressIndicatorBuilder: (context) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              firstPageErrorIndicatorBuilder: (_) => PaginationErrorPage(
                  pagingController: controller.pagingController),
            ),
          )),
        );
      },
    );
  }

  Widget _getStatusIcon(ProductStatus status) {
    switch (status) {
      case ProductStatus.draft:
        return const Icon(Icons.circle, color: Colors.grey, size: 12);
      case ProductStatus.proposed:
        return const Icon(Icons.circle, color: Colors.grey, size: 12);

      case ProductStatus.published:
        return const Icon(Icons.circle, color: Colors.green, size: 12);

      case ProductStatus.rejected:
        return const Icon(Icons.circle, color: Colors.red, size: 12);
    }
  }
}

class CollectionProductsController extends GetxController {
  CollectionProductsController(
      {required this.productsUseCase, required this.collectionDetailsUseCase});

  CollectionDetailsUseCase collectionDetailsUseCase;
  ProductsUseCase productsUseCase;
  final String collectionId = Get.arguments;
  final int _pageSize = 20;
  final PagingController<int, Product> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  List<String> productsIds = [];
  final List<String> originalProductsIds = [];
  Function eq = const SetEquality().equals;
  bool get isEqual => eq(productsIds.toSet(), originalProductsIds.toSet());

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await productsUseCase.fetchProducts(
      queryParameters: {
        'fields': 'id,title,thumbnail,status,handle,collection_id',
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );

    result.when((success) {
      final isLastPage = success.products!.length < _pageSize;
      success.products?.forEach((product) {
        productsIds.addIf(product.collectionId == collectionId, product.id!);
        originalProductsIds.addIf(
            product.collectionId == collectionId, product.id!);
      });

      if (isLastPage) {
        pagingController.appendLastPage(success.products!);
      } else {
        final nextPageKey = pageKey + success.products!.length;
        pagingController.appendPage(success.products!, nextPageKey);
      }
    }, (error) => pagingController.error = error);
  }

  Future<void> save(BuildContext context) async {
    final addedProducts =
        productsIds.toSet().difference(originalProductsIds.toSet()).toList();
    final removedProducts =
        originalProductsIds.toSet().difference(productsIds.toSet()).toList();
    loading();
    if (addedProducts.isNotEmpty) {
      final result = await collectionDetailsUseCase.updateProducts(
          UserCollectionUpdateProductsReq(
              collectionId: collectionId, productsIds: addedProducts));
      result.when((success) {
        if (removedProducts.isEmpty) {
          EasyLoading.showSuccess('Collection updated');
          context.popRoute(true);
        } else {
          EasyLoading.showError('Error updating collection');
          return;
        }
      }, (error) {
        EasyLoading.showError('Error updating collection');
        return;
      });
    }
    if (removedProducts.isNotEmpty) {
      final result = await collectionDetailsUseCase.removeProducts(
          UserCollectionRemoveProductsReq(
              collectionId: collectionId, productsIds: removedProducts));
      result.when((success) {
        EasyLoading.showSuccess('Collection updated');
        context.popRoute(true);
      }, (error) {
        EasyLoading.showError('Error updating collection');
        return;
      });
    }
    dismissLoading();
  }
}
