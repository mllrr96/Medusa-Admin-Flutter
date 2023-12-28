import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer_group.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import '../../../../data/models/store/customer.dart';
import '../../../draft_orders_module/create_draft_order/components/pick_customer/controllers/pick_customer_controller.dart';
import '../../groups/controllers/groups_controller.dart';

class GroupDetailsController extends GetxController {
  GroupDetailsController(
      {required this.customerGroupRepo, required this.groupCustomer});
  final CustomerGroupRepo customerGroupRepo;

  final PagingController<int, Customer> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final scrollController = ScrollController();
  RxInt customerGroupsCount = 0.obs;
  final CustomerGroup groupCustomer;
  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await customerGroupRepo
        .retrieveCustomers(id: groupCustomer.id!, queryParameters: {
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
      pagingController.error =
          'Error loading customer groups \n ${error.message}';
    });
  }

  Future<void> deleteCustomer(String customerId) async {
    loading();
    final result = await customerGroupRepo
        .removeCustomers(id: groupCustomer.id!, customerIds: [customerId]);

    result.when((success) {
      EasyLoading.showSuccess('Customer removed');
      pagingController.refresh();
      GroupsController.instance.pagingController.refresh();
    },
        (error) {

        });
    dismissLoading();
  }

  Future<void> addCustomers(BuildContext context) async {
    if (pagingController.value.itemList == null) {
      return;
    }
    final pickCustomerReq = await context.pushRoute(PickCustomerRoute(
      pickCustomerReq: PickCustomerReq(
          multipleSelection: true,
          selectedCustomers: pagingController.value.itemList)
    ));
    if (pickCustomerReq == null) {
      return;
    }
    final newCustomers = (pickCustomerReq as PickCustomerRes)
        .selectedCustomers
        .map((e) => e.id!)
        .toList();
    loading();
    final result = await customerGroupRepo.addCustomers(
        id: groupCustomer.id!, customerIds: newCustomers);

    result.when((success) {
      EasyLoading.showSuccess('Customers added');
      pagingController.refresh();
      GroupsController.instance.pagingController.refresh();
    },
        (error) =>
        context.showSnackBar(error.toSnackBarString()));
    dismissLoading();
  }

  Future<void> deleteGroup(BuildContext context) async {
    loading();
    final result =
        await customerGroupRepo.deleteCustomerGroup(id: groupCustomer.id!);
    result.when((success) {
      GroupsController.instance.pagingController.refresh();
      context.showSnackBar('Customer Group deleted');
      context.popRoute();
    }, (error) => context.showSnackBar(error.toSnackBarString()));
    dismissLoading();
  }
}
