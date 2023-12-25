import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';

import '../../../../data/models/store/customer_group.dart';

class PickGroupsController extends GetxController {
  PickGroupsController({required this.groupRepo, required this.pickGroupsReq});
  final CustomerGroupRepo groupRepo;
  final PickGroupsReq? pickGroupsReq;
  late PickGroupsReq groupsReq;
  final PagingController<int, CustomerGroup> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  var selectedGroups = <CustomerGroup>[];

  @override
  Future<void> onInit() async {
    groupsReq = pickGroupsReq ?? PickGroupsReq();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    if (groupsReq.selectedGroups?.isNotEmpty ?? false) {
      selectedGroups = groupsReq.selectedGroups!;
    }

    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await groupRepo.retrieveCustomerGroups(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );

    result.when((success) {
      final isLastPage = success.customerGroups!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.customerGroups!);
      } else {
        final nextPageKey = pageKey + success.customerGroups!.length;
        pagingController.appendPage(success.customerGroups!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
    });
  }
}

class PickGroupsReq {
  PickGroupsReq({this.selectedGroups, this.multipleSelect = false});
  final List<CustomerGroup>? selectedGroups;
  final bool multipleSelect;
}

class PickGroupsRes {
  PickGroupsRes({required this.selectedGroups});
  final List<CustomerGroup> selectedGroups;
}
