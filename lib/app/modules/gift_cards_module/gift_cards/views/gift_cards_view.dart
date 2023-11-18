import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../components/index.dart';
import '../controllers/gift_cards_controller.dart';

class GiftCardsView extends GetView<GiftCardsController> {
  const GiftCardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final bottomPadding = context.mediaQueryViewPadding.bottom == 0 ? 12.0 : context.mediaQueryViewPadding.bottom;
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Gift Cards'),
      ),
      floatingActionButton: ScrollingExpandableFab(
        controller: controller.scrollController,
        label: 'Gift Card',
        icon: const Icon(Icons.add),
        onPressed: () async =>
            await showBarModalBottomSheet(context: context, builder: (context) => const CreateGiftCardView()),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: bottomPadding),
        decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            border: Border(top: BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black))),
        child: ListTile(
          title: const Text('Gift Cards History'),
          subtitle: Text('See the history of purchased Gift Cards', style: smallTextStyle),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () => Get.toNamed(Routes.CUSTOM_GIFT_CARDS),
        ),
      ),
      body: CustomScrollView(
        controller: controller.scrollController,
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
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 80),
            sliver: PagedSliverList.separated(
                pagingController: controller.productsPagingController,
                builderDelegate: PagedChildBuilderDelegate<Product>(
                  itemBuilder: (context, product, index) {
                    final published = product.status == ProductStatus.published;
                    final listTile = ListTile(
                        tileColor: Theme.of(context).appBarTheme.backgroundColor,
                        contentPadding: const EdgeInsets.only(left: 16.0),
                        title: Text(product.title ?? ''),
                        subtitle: product.description != null
                            ? Text(
                                product.description!,
                                style: smallTextStyle?.copyWith(color: lightWhite),
                              )
                            : null,
                        trailing: AdaptiveIcon(
                            onPressed: () async {
                              await showModalActionSheet<int>(
                                  title: 'Manage gift card',
                                  message: product.title,
                                  context: context,
                                  actions: <SheetAction<int>>[
                                    const SheetAction(label: 'Edit', key: 0),
                                    SheetAction(label: published ? 'Unpublish' : 'Publish', key: 1),
                                    const SheetAction(label: 'Delete', isDestructiveAction: true, key: 2),
                                  ]).then((result) async {
                                switch (result) {
                                  case 0:
                                    break;
                                  case 1:
                                    await controller.toggleProduct(product);
                                    break;
                                  case 2:
                                    await showOkCancelAlertDialog(
                                            context: context,
                                            title: 'Confirm gift card deletion',
                                            message: 'Are you sure you want to delete this gift card?',
                                            isDestructiveAction: true)
                                        .then((result) async {
                                      if (result == OkCancelResult.ok) {
                                        await controller.deleteProduct(product.id!);
                                      }
                                    });
                                    break;
                                }
                              });
                            },
                            icon: const Icon(Icons.more_horiz)));
                    const disabledDot = Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.circle, color: Colors.red, size: 8),
                    );
                    if (published) {
                      return listTile;
                    } else {
                      return Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [listTile, disabledDot],
                      );
                    }
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
          ),
        ],
      ),
    );
  }
}
