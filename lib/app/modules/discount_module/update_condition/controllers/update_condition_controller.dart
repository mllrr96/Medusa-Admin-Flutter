import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/data/repository/product_tag/product_tag_repo.dart';
import 'package:medusa_admin/app/data/repository/product_type/product_type_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/discount_module/discount_conditions/components/index.dart';
import 'package:collection/collection.dart';
import '../../discount_conditions/controllers/discount_conditions_controller.dart';

class UpdateConditionController extends GetxController {
  final UpdateConditionReq updateConditionReq = Get.arguments;
  List conditionItems = [];
  List items = [];
  List selectedItems = [];

  late ProductsRepo productsRepo;
  late ProductTypeRepo typeRepo;
  late CollectionRepo collectionRepo;
  late ProductTagRepo tagRepo;
  late CustomerGroupRepo groupRepo;
  Function eq = const DeepCollectionEquality.unordered().equals;

  @override
  Future<void> onInit() async {
    await loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    loading();
    final condition = updateConditionReq.discountCondition;
    switch (updateConditionReq.discountConditionType) {
      case DiscountConditionType.products:
        productsRepo = ProductsRepo();
        final result = await productsRepo.retrieveAll(queryParams: {'discount_condition_id': condition.id!});
        result.when((success) {
          selectedItems = <Product>[];
          items = <Product>[];
          conditionItems = <Product>[];
          conditionItems.addAll(success.products!);
          selectedItems.addAll(success.products!);
          items.addAll(success.products!);
          update();
        }, (error) {
          Get.back();
          Get.snackbar('Error loading products ${error.code ?? ''}', error.message,
              snackPosition: SnackPosition.BOTTOM);
        });
        break;
      case DiscountConditionType.productType:
        typeRepo = ProductTypeRepo();
        final result = await typeRepo.retrieveProductTypes(queryParameters: {'discount_condition_id': condition.id!});
        result.when((success) {
          selectedItems = <ProductType>[];
          items = <ProductType>[];
          conditionItems = <ProductType>[];
          conditionItems.addAll(success.productTypes!);
          selectedItems.addAll(success.productTypes!);
          items.addAll(success.productTypes!);
          update();
        }, (error) {
          Get.back();
          Get.snackbar('Error loading product types ${error.code ?? ''}', error.message,
              snackPosition: SnackPosition.BOTTOM);
        });
        break;
      case DiscountConditionType.productCollections:
        collectionRepo = CollectionRepo();
        final result = await collectionRepo.retrieveAll(queryParameters: {'discount_condition_id': condition.id!});
        result.when((success) {
          selectedItems = <ProductCollection>[];
          items = <ProductCollection>[];
          conditionItems = <ProductCollection>[];
          conditionItems.addAll(success.collections!);
          selectedItems.addAll(success.collections!);
          items.addAll(success.collections!);
          update();
        }, (error) {
          Get.back();
          Get.snackbar('Error loading collections ${error.code ?? ''}', error.message,
              snackPosition: SnackPosition.BOTTOM);
        });
        break;
      case DiscountConditionType.productTags:
        tagRepo = ProductTagRepo();
        final result = await tagRepo.retrieveProductTags(queryParameters: {'discount_condition_id': condition.id!});
        result.when((success) {
          selectedItems = <ProductTag>[];
          items = <ProductTag>[];
          conditionItems = <ProductTag>[];
          conditionItems.addAll(success.tags!);
          selectedItems.addAll(success.tags!);
          items.addAll(success.tags!);
          update();
        }, (error) {
          Get.back();
          Get.snackbar('Error loading collections ${error.code ?? ''}', error.message,
              snackPosition: SnackPosition.BOTTOM);
        });
        break;
      case DiscountConditionType.customerGroups:
        groupRepo = CustomerGroupRepo();
        final result =
            await groupRepo.retrieveCustomerGroups(queryParameters: {'discount_condition_id': condition.id!});
        result.when((success) {
          selectedItems = <CustomerGroup>[];
          items = <CustomerGroup>[];
          conditionItems = <CustomerGroup>[];
          conditionItems.addAll(success.customerGroups!);
          selectedItems.addAll(success.customerGroups!);
          items.addAll(success.customerGroups!);
          update();
        }, (error) {
          Get.back();
          Get.snackbar('Error loading groups ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
        });
        break;
    }

    dismissLoading();
  }

  Future<void> add() async {
    switch (updateConditionReq.discountConditionType) {
      case DiscountConditionType.products:
        final result = await Get.to(() => const ConditionProductView(), arguments: items as List<Product>);
        if (result != null && result is DiscountConditionRes) {
          items.addAll(result.products!);
          selectedItems.addAll(result.products!);
          update();
        }
        break;
      case DiscountConditionType.productType:
        final result = await Get.to(() => const ConditionTypeView(), arguments: items as List<ProductType>);
        if (result != null && result is DiscountConditionRes) {
          items.addAll(result.productTypes!);
          selectedItems.addAll(result.productTypes!);
          update();
        }
        break;
      case DiscountConditionType.productCollections:
        final result = await Get.to(() => const ConditionCollectionView(), arguments: items as List<ProductCollection>);
        if (result != null && result is DiscountConditionRes) {
          items.addAll(result.productCollections!);
          selectedItems.addAll(result.productCollections!);
          update();
        }
        break;
      case DiscountConditionType.productTags:
        final result = await Get.to(() => const ConditionTagView(), arguments: items as List<ProductTag>);
        if (result != null && result is DiscountConditionRes) {
          items.addAll(result.productTags!);
          selectedItems.addAll(result.productTags!);
          update();
        }
        break;
      case DiscountConditionType.customerGroups:
        final result = await Get.to(() => const ConditionCustomerGroupView(), arguments: items as List<CustomerGroup>);
        if (result != null && result is DiscountConditionRes) {
          items.addAll(result.customerGroups!);
          selectedItems.addAll(result.customerGroups!);
          update();
        }
        break;
    }
  }

  void save() {
    switch (updateConditionReq.discountConditionType) {
      case DiscountConditionType.products:
        if (eq((conditionItems as List<Product>).map((e) => e.id!).toList(),
            (selectedItems as List<Product>).map((e) => e.id!).toList())) {
          Get.back();
        } else {
          Get.back(
              result: UpdateConditionRes(
            updatedItemIds: (selectedItems as List<Product>).map((e) => e.id!).toList(),
            originalItemIds: (conditionItems as List<Product>).map((e) => e.id!).toList(),
            discountCondition: updateConditionReq.discountCondition,
            discountConditionType: updateConditionReq.discountConditionType,
          ));
        }
        return;
      case DiscountConditionType.productType:
        if (eq((conditionItems as List<ProductType>).map((e) => e.id!).toList(),
            (selectedItems as List<ProductType>).map((e) => e.id!).toList())) {
          Get.back();
        } else {
          Get.back(
              result: UpdateConditionRes(
            updatedItemIds: (selectedItems as List<ProductType>).map((e) => e.id!).toList(),
            originalItemIds: (conditionItems as List<ProductType>).map((e) => e.id!).toList(),
            discountCondition: updateConditionReq.discountCondition,
            discountConditionType: updateConditionReq.discountConditionType,
          ));
        }
        return;
      case DiscountConditionType.productCollections:
        if (eq((conditionItems as List<ProductCollection>).map((e) => e.id!).toList(),
            (selectedItems as List<ProductCollection>).map((e) => e.id!).toList())) {
          Get.back();
        } else {
          Get.back(
              result: UpdateConditionRes(
            updatedItemIds: (selectedItems as List<ProductCollection>).map((e) => e.id!).toList(),
            originalItemIds: (conditionItems as List<ProductCollection>).map((e) => e.id!).toList(),
            discountCondition: updateConditionReq.discountCondition,
            discountConditionType: updateConditionReq.discountConditionType,
          ));
        }
        return;
      case DiscountConditionType.productTags:
        if (eq((conditionItems as List<ProductTag>).map((e) => e.id!).toList(),
            (selectedItems as List<ProductTag>).map((e) => e.id!).toList())) {
          Get.back();
        } else {
          Get.back(
              result: UpdateConditionRes(
            updatedItemIds: (selectedItems as List<ProductTag>).map((e) => e.id!).toList(),
            originalItemIds: (conditionItems as List<ProductTag>).map((e) => e.id!).toList(),
            discountCondition: updateConditionReq.discountCondition,
            discountConditionType: updateConditionReq.discountConditionType,
          ));
        }
        return;
      case DiscountConditionType.customerGroups:
        if (eq((conditionItems as List<CustomerGroup>).map((e) => e.id!).toList(),
            (selectedItems as List<CustomerGroup>).map((e) => e.id!).toList())) {
          Get.back();
        } else {
          Get.back(
              result: UpdateConditionRes(
            updatedItemIds: (selectedItems as List<CustomerGroup>).map((e) => e.id!).toList(),
            originalItemIds: (conditionItems as List<CustomerGroup>).map((e) => e.id!).toList(),
            discountCondition: updateConditionReq.discountCondition,
            discountConditionType: updateConditionReq.discountConditionType,
          ));
        }
        return;
    }
  }
}

class UpdateConditionReq {
  final DiscountConditionType discountConditionType;
  final DiscountCondition discountCondition;

  UpdateConditionReq({required this.discountCondition, required this.discountConditionType});
}

class UpdateConditionRes {
  final List<String> updatedItemIds;
  final List<String> originalItemIds;
  final DiscountConditionType discountConditionType;
  final DiscountCondition discountCondition;
  UpdateConditionRes(
      {required this.updatedItemIds,
      required this.originalItemIds,
      required this.discountCondition,
      required this.discountConditionType});
}
