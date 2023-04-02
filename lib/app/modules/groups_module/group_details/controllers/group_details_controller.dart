import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import '../../../../data/models/store/customer.dart';
import '../../../../routes/app_pages.dart';
import '../../../draft_orders_module/create_draft_order/components/pick_customer/controllers/pick_customer_controller.dart';
import '../../groups/controllers/groups_controller.dart';

class GroupDetailsController extends GetxController {
  GroupDetailsController({required this.customerGroupRepo});
  final CustomerGroupRepo customerGroupRepo;

  final PagingController<int, Customer> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  RxInt customerGroupsCount = 0.obs;
  String id = Get.arguments;
  RxString groupName = ''.obs;
  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    await customerGroupRepo
        .retrieveCustomerGroup(id: id)
        .then((value) => value.whenSuccess((success) => groupName.value = success.customerGroup?.name ?? ''));
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await customerGroupRepo.retrieveCustomers(id: id, queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'expand': 'groups',
    });
    result.when((success) {
      final isLastPage = success.customers!.length < _pageSize;
      customerGroupsCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.customers!);
      } else {
        final nextPageKey = pageKey + success.customers!.length;
        pagingController.appendPage(success.customers!, nextPageKey);
      }
    }, (error) {
      pagingController.error = 'Error loading customer groups \n ${error.message}';
    });
  }

  Future<void> deleteCustomer(String customerId) async {
    loading();
    final result = await customerGroupRepo.removeCustomers(id: id, customerIds: [customerId]);

    result.when((success) {
      EasyLoading.showSuccess('Customer removed');
      pagingController.refresh();
      GroupsController.instance.pagingController.refresh();
    },
        (error) =>
            Get.snackbar('Error removing customer from group', error.message, snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }

  Future<void> addCustomers() async {
    if (pagingController.value.itemList == null) {
      return;
    }
    final pickCustomerReq = await Get.toNamed(Routes.PICK_CUSTOMER,
        arguments: PickCustomerReq(multipleSelection: true, selectedCustomers: pagingController.value.itemList));

    if (pickCustomerReq == null) {
      return;
    }
    final newCustomers = (pickCustomerReq as PickCustomerRes).selectedCustomers.map((e) => e.id!).toList();
    loading();
    final result = await customerGroupRepo.addCustomers(id: id, customerIds: newCustomers);

    result.when((success) {
      EasyLoading.showSuccess('Customers added');
      pagingController.refresh();
      GroupsController.instance.pagingController.refresh();
    }, (error) => Get.snackbar('Error adding customer to the group', error.message));
    dismissLoading();
  }
}
