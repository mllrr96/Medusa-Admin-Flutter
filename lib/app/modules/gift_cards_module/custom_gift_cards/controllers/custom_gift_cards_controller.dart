import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/req/user_gift_card_req.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../data/models/store/gift_card.dart';
import '../../../../data/repository/gift_card/gift_card_repo.dart';

class CustomGiftCardsController extends GetxController {
  CustomGiftCardsController({required this.giftCardRepo});
  final GiftCardRepo giftCardRepo;

  final customGiftCardsPagingController = PagingController<int, GiftCard>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;

  @override
  void onInit() {
    customGiftCardsPagingController.addPageRequestListener((pageKey) => _fetchCustomGiftCards(pageKey));
    super.onInit();
  }

  Future<void> _fetchCustomGiftCards(int pageKey) async {
    final result = await giftCardRepo.retrieveGiftCards(
      queryParameters: {
        'offset': customGiftCardsPagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );
    result.when((success) {
      if (success.giftCards == null) {
        customGiftCardsPagingController.error = 'Error loading gift cards, received null value';
        return;
      }
      final isLastPage = success.giftCards!.length < _pageSize;
      if (isLastPage) {
        customGiftCardsPagingController.appendLastPage(success.giftCards!);
      } else {
        final nextPageKey = pageKey + success.giftCards!.length;
        customGiftCardsPagingController.appendPage(success.giftCards!, nextPageKey);
      }
      // refreshController.refreshCompleted();
    }, (error) {
      customGiftCardsPagingController.error = 'Error loading gift cards';
      // refreshController.refreshFailed();
    });
  }

  Future<void> updateCustomGiftCard({required String id, required UserUpdateGiftCardReq userUpdateGiftCardReq,
  bool getBack= true
  }) async {
    loading();
    final result = await giftCardRepo.updateGiftCard(id: id, userUpdateGiftCardReq: userUpdateGiftCardReq);

    result.when((success) {
      if(getBack){
        Get.back();
      }
      customGiftCardsPagingController.refresh();
      EasyLoading.showSuccess('Gift Card Updated');
    }, (error) => Get.snackbar('Error updating gift card', error.message, snackPosition: SnackPosition.BOTTOM));

    dismissLoading();
  }
}
