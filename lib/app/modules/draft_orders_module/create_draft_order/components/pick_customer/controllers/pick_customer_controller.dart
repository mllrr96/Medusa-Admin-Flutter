import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/customer_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';


class PickCustomerController extends GetxController with StateMixin<List<Customer>> {
  PickCustomerController({required this.customerUseCase, required this.pickCustomerReq});
  final CustomerUseCase customerUseCase;
  final int _pageSize = 12;
  final PagingController<int, Customer> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 4);
  List<Customer> selectedCustomers = [];
  List<Customer> disabledCustomers = [];
  final searchCtrl = TextEditingController();
  final PickCustomerReq pickCustomerReq;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    if (pickCustomerReq.selectedCustomers != null) {
      selectedCustomers.addAll(pickCustomerReq.selectedCustomers!);
    }
    if (pickCustomerReq.disabledCustomers != null) {
      disabledCustomers.addAll(pickCustomerReq.disabledCustomers!);
    }
    searchCtrl.addListener(() {
      pagingController.refresh();
    });

    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await customerUseCase.retrieveCustomers(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        'q': searchCtrl.text,
      },
    );

    result.when((success) {
      final isLastPage = success.customers!.length < _pageSize;

      if (isLastPage) {
        pagingController.appendLastPage(success.customers!);
      } else {
        final nextPageKey = pageKey + success.customers!.length;
        pagingController.appendPage(success.customers!, nextPageKey);
      }
    }, (error) => pagingController.error = error);
  }
}

class PickCustomerReq {
  final List<Customer>? selectedCustomers;
  final List<Customer>? disabledCustomers;
  final bool multipleSelection;
  PickCustomerReq({
    this.multipleSelection = false,
    this.selectedCustomers,
    this.disabledCustomers,
  });
}

class PickCustomerRes {
  final List<Customer> selectedCustomers;
  PickCustomerRes({
    required this.selectedCustomers,
  });
}
