import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/drawer.dart';
import '../../../data/service/storage_service.dart';
import '../controllers/gift_cards_controller.dart';

class GiftCardsView extends GetView<GiftCardsController> {
  const GiftCardsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final isDrawer = StorageService.appSettings.isDrawer;
    return Scaffold(
      appBar: AppBar(
        leading: isDrawer ? null : const AdaptiveBackButton(),
        title: const Text('Gift Cards'),
      ),
      drawer: isDrawer ? const AppDrawer() : null,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Manage the Gift Cards of your Medusa store',
                style: smallTextStyle?.copyWith(color: lightWhite),
              ),
            ),
          ),
          PagedSliverList.separated(
              pagingController: controller.productsPagingController,
              builderDelegate: PagedChildBuilderDelegate<Product>(
                itemBuilder: (context, product, index) {
                  final published = product.status == ProductStatus.published;
                  return ListTile(
                    title: Text(product.title ?? ''),
                    subtitle: Text(
                      product.description ?? '',
                      style: smallTextStyle?.copyWith(color: lightWhite),
                    ),
                    trailing: Text(published ? 'Published' : 'Disabled'),
                  );
                },
                noItemsFoundIndicatorBuilder: (_) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Are you ready to sell your first Gift Card?'),
                      Text(
                        'No Gift Card has been added yet.',
                        style: smallTextStyle?.copyWith(color: lightWhite),
                      ),
                      AdaptiveButton(onPressed: () {}, child: const Text('Create Gift Card'))
                    ],
                  );
                },
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
              ),
              separatorBuilder: (_, __) => const Divider(height: 0)),
          const SliverToBoxAdapter(child: Divider()),
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('History'),
              ),
            ),
          ),
          PagedSliverList.separated(
              pagingController: controller.giftCardsPagingController,
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
    );
  }
}
