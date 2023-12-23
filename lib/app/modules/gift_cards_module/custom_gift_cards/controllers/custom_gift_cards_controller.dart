import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/req/user_gift_card_req.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/models/store/gift_card.dart';
import '../../../../data/repository/gift_card/gift_card_repo.dart';

class CustomGiftCardsController extends GetxController {
  static CustomGiftCardsController get instance =>
      Get.find<CustomGiftCardsController>();
  CustomGiftCardsController({required this.giftCardRepo});
  final GiftCardRepo giftCardRepo;

  final pagingController = PagingController<int, GiftCard>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final scrollController = ScrollController();
  final refreshController = RefreshController();
  bool _refreshingData = false;
  RxInt giftCardsCount = 0.obs;

  @override
  void onInit() {
    pagingController
        .addPageRequestListener((pageKey) => _fetchCustomGiftCards(pageKey));
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    pagingController.dispose();
    super.onClose();
  }

  Future<void> _fetchCustomGiftCards(int pageKey) async {
    if (_refreshingData) {
      return;
    }
    final result = await giftCardRepo.retrieveGiftCards(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );
    result.when((success) {
      final isLastPage = success.giftCards!.length < _pageSize;
      giftCardsCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.giftCards!);
      } else {
        final nextPageKey = pageKey + success.giftCards!.length;
        pagingController.appendPage(success.giftCards!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = error;
      refreshController.refreshFailed();
    });
  }

  Future<void> refreshData() async {
    _refreshingData = true;
    final result = await giftCardRepo.retrieveGiftCards(
      queryParameters: {
        'offset': 0,
        'limit': _pageSize,
      },
    );
    await result.when((success) async {
      final isLastPage = success.giftCards!.length < _pageSize;
      giftCardsCount.value = success.count ?? 0;
      pagingController.value = const PagingState(
        nextPageKey: null,
        error: null,
        itemList: null,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      if (isLastPage) {
        pagingController.appendLastPage(success.giftCards!);
      } else {
        pagingController.appendPage(
            success.giftCards!, success.giftCards!.length);
      }
      refreshController.refreshCompleted();
    }, (_) {
      Fluttertoast.showToast(msg: "Error refreshing data");
      refreshController.refreshFailed();
    });
    _refreshingData = false;
  }

  Future<void> updateCustomGiftCard(
      {required String id,
      required UserUpdateGiftCardReq userUpdateGiftCardReq,
      bool getBack = true,
      required BuildContext context}) async {
    loading();
    final result = await giftCardRepo.updateGiftCard(
        id: id, userUpdateGiftCardReq: userUpdateGiftCardReq);

    result.when((success) {
      if (getBack) {
        context.popRoute();
      }
      pagingController.refresh();
      EasyLoading.showSuccess('Gift Card Updated');
    },
        (error) => Get.snackbar('Error updating gift card', error.message,
            snackPosition: SnackPosition.BOTTOM));

    dismissLoading();
  }
}
