import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';

import '../../../data/models/store/gift_card.dart';
import '../../../data/repository/gift_card/gift_card_repo.dart';

class CustomGiftCardsView extends GetView<CustomGiftCardsController> {
  const CustomGiftCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Gift Cards History'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'See the history of purchased Gift Cards',
                  style: smallTextStyle?.copyWith(color: lightWhite),
                ),
              ),
            ),
            PagedSliverList.separated(
                pagingController: controller.customGiftCardsPagingController,
                builderDelegate: PagedChildBuilderDelegate<GiftCard>(
                  itemBuilder: (context, giftCard, index) {
                    return ListTile(
                      tileColor: Theme.of(context).appBarTheme.backgroundColor,
                      title: Text(giftCard.code ?? ''),
                      subtitle: Text(
                        giftCard.orderId ?? '_',
                        style: smallTextStyle?.copyWith(color: lightWhite),
                      ),
                      // trailing: Text(disabled ? 'Disabled':'Published'),
                    );
                  },
                  noItemsFoundIndicatorBuilder: (_) => const Center(child: Text('No Gift cards')),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                ),
                separatorBuilder: (_, __) => const Divider(height: 0)),
          ],
        ),
      ),
    );
  }
}

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
}

class CustomGiftCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomGiftCardsController(giftCardRepo: GiftCardRepo()));
  }
}
