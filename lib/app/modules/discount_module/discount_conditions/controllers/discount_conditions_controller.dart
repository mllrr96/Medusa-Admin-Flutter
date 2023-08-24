import 'package:get/get.dart';
import '../../../../data/models/store/index.dart';
import 'package:medusa_admin/core/utils/enums.dart';


class DiscountConditionsController extends GetxController {
  late List<DiscountConditionType> disabledConditions;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is DiscountConditionReq) {
      disabledConditions = (Get.arguments as DiscountConditionReq).discountTypes ?? [];
    } else {
      disabledConditions = [];
    }
    super.onInit();
  }
  //
  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}

class DiscountConditionRes {
  final List<Product>? products;
  final List<ProductType>? productTypes;
  final List<ProductTag>? productTags;
  final List<ProductCollection>? productCollections;
  final List<CustomerGroup>? customerGroups;
  final DiscountConditionOperator operator;
  final DiscountConditionType conditionType;
  DiscountConditionRes({
    required this.operator,
    required this.conditionType,
    this.products,
    this.productTypes,
    this.productTags,
    this.productCollections,
    this.customerGroups,
  });
}

class DiscountConditionReq {
  DiscountConditionReq({this.discountTypes});
  List<DiscountConditionType>? discountTypes;
}
