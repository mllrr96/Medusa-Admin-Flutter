import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/region_details_use_case.dart';
import 'package:medusa_admin/presentation/modules/settings_module/store_settings/regions_module/regions/controllers/regions_controller.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';

class RegionDetailsController extends GetxController with StateMixin<Region> {
  RegionDetailsController(
      {required this.regionDetailsUseCase, required this.regionId});
  static RegionDetailsController get instance =>
      Get.find<RegionDetailsController>();
  final RegionDetailsUseCase regionDetailsUseCase;
  final String regionId;
  RxString regionName = 'Region'.obs;
  late Future<List<ShippingOption>?> shippingOptionsFuture;
  late Future<List<ShippingOption>?> returnShippingOptionsFuture;

  @override
  Future<void> onInit() async {
    await loadRegion();
    updateOptions();
    updateReturnOptions();
    super.onInit();
  }

  Future<void> loadRegion() async {
    change(null, status: RxStatus.loading());
    final result = await regionDetailsUseCase.fetchRegion(
      regionId,
      queryParameters: {
        'expand': 'countries,payment_providers,fulfillment_providers',
      },
    );
    result.when(
      (region) {
        change(region, status: RxStatus.success());
        regionName.value = region.name!;
      },
      (error) => change(null, status: RxStatus.error(error.message)),
    );
  }

  Future<void> deleteShippingOption(String id,
      {bool returnShippingOption = false}) async {
    loading();
    final result = await regionDetailsUseCase.deleteShippingOption(id);
    await result.when((success) async {
      if (success.deleted ?? false) {
        dismissLoading();
        if (!returnShippingOption) {
          updateOptions();
        } else {
          updateReturnOptions();
        }
      } else {
        EasyLoading.showError('Error deleting shipping option');
      }
    }, (error) {
      debugPrint(error.toString());
      EasyLoading.showError('Error deleting shipping option');
    });
  }

  Future<void> deleteRegion(BuildContext context) async {
    change(null, status: RxStatus.loading());
    final result = await regionDetailsUseCase.deleteRegion(regionId);
    result.when(
      (success) {
        if (success.deleted) {
          context.popRoute();
          EasyLoading.showSuccess('Region deleted');
          RegionsController.instance.pagingController.refresh();
        }
      },
      (error) async {
        debugPrint(error.toString());
        EasyLoading.showError('Error deleting region');
        await loadRegion();
      },
    );
  }

  Future<List<ShippingOption>?> retrieveShippingOptions(
      {bool isReturn = false}) async {
    final result = await regionDetailsUseCase.fetchShippingOptions(
      queryParameters: {
        'region_id': regionId,
        'is_return': isReturn,
      },
    );

    return result.when(
      (success) {
        return success.shippingOptions;
      },
      (error) {
        debugPrint(error.toString());
        return null;
      },
    );
  }

  void updateReturnOptions() {
    returnShippingOptionsFuture = retrieveShippingOptions(isReturn: true);
  }

  void updateOptions() {
    shippingOptionsFuture = retrieveShippingOptions();
  }
}
