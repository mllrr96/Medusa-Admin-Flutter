import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../components/index.dart';
import '../controllers/gift_cards_controller.dart';

class GiftCardsView extends GetView<GiftCardsController> {
  const GiftCardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme
        .of(context)
        .textTheme
        .titleSmall;
    final bottomPadding = context.mediaQueryViewPadding.bottom == 0 ? 12.0 : context.mediaQueryViewPadding.bottom;
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Gift Cards'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async =>
        await showBarModalBottomSheet(context: context, builder: (context) => const CreateGiftCardView()),
        icon: const Icon(Icons.add),
        label: const Text('Gift Card'),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: bottomPadding),
        color: context.theme.appBarTheme.backgroundColor,
        child: ListTile(
          title: const Text('Gift Cards History'),
          subtitle: Text('See the history of purchased Gift Cards', style: smallTextStyle),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () => Get.toNamed(Routes.CUSTOM_GIFT_CARDS),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // if(controller.productsPagingController.itemList?.isNotEmpty ?? false)
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Are you ready to sell your first Gift Card?'),
                      Text(
                        'No Gift Card has been added yet.',
                        style: smallTextStyle?.copyWith(color: lightWhite),
                      ),
                      AdaptiveButton(
                          onPressed: () async {
                            await showBarModalBottomSheet(
                                context: context, builder: (context) => const CreateGiftCardView());
                          },
                          child: const Text('Create Gift Card'))
                    ],
                  );
                },
                firstPageProgressIndicatorBuilder: (context) =>
                const Center(child: CircularProgressIndicator.adaptive()),
              ),
              separatorBuilder: (_, __) => const Divider(height: 0)),
        ],
      ),
    );
  }
}
