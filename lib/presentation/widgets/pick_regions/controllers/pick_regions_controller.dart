import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class PickRegionsController extends GetxController {
  PickRegionsController({required this.regionsRepo, this.pickRegionsReq});
  final RegionsRepository regionsRepo;
  final PickRegionsReq? pickRegionsReq;
  final PagingController<int, Region> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  late PickRegionsReq regionsReq;
  var selectedRegions = <Region>[];

  @override
  void onInit() {
    regionsReq = pickRegionsReq ?? PickRegionsReq();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    if (regionsReq.selectedRegions?.isNotEmpty ?? false) {
      selectedRegions = regionsReq.selectedRegions!;
    }

    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final result = await regionsRepo.retrieveAll(
        queryParameters: {
          'offset': pagingController.itemList?.length ?? 0,
          'limit': _pageSize,
        },
      );
      if (result != null) {
        final isLastPage = result.regions!.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(result.regions!);
        } else {
          final nextPageKey = pageKey + result.regions!.length;
          pagingController.appendPage(result.regions!, nextPageKey);
        }
      }
    } catch (error) {
      pagingController.error = error;
    }

    //
    // result.when((success) {
    //   final isLastPage = success.regions!.length < _pageSize;
    //   if (isLastPage) {
    //     pagingController.appendLastPage(success.regions!);
    //   } else {
    //     final nextPageKey = pageKey + success.regions!.length;
    //     pagingController.appendPage(success.regions!, nextPageKey);
    //   }
    // }, (error) {
    //   pagingController.error = error.message;
    // });
  }
}

class PickRegionsReq {
  final bool multipleSelect;
  final List<Region>? selectedRegions;
  PickRegionsReq({this.multipleSelect = false, this.selectedRegions});
}

class PickRegionsRes {
  final List<Region> regions;
  PickRegionsRes({required this.regions});
}
