import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../../data/models/store/gift_card.dart';
import '../../../components/adaptive_back_button.dart';
import '../../../components/adaptive_icon.dart';
import '../components/index.dart';
import '../controllers/custom_gift_cards_controller.dart';

class CustomGiftCardsView extends GetView<CustomGiftCardsController> {
  const CustomGiftCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;

    String getCurrencyText(GiftCard giftCard) {
      var value = giftCard.value?.roundToDouble() ?? 0.0;
      var balance = giftCard.balance?.roundToDouble() ?? 0.0;
      final valueFormatter = NumberFormat.currency(name: giftCard.region?.currencyCode);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
        balance = balance / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      return '${valueFormatter.format(balance).split(valueFormatter.currencySymbol)[1]} / ${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]} ${valueFormatter.currencySymbol.toUpperCase()}';
    }

    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Gift Cards History'),
        actions: [
          AdaptiveIcon(onPressed: () {}, icon: const Icon(MedusaIcons.magnifying_glass)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(Routes.CREATE_UPDATE_CUSTOM_GIFT_CARD),
        label: Text('Custom Gift Card'),
        icon: Icon(Icons.add),
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
                      onTap: () {
                        showBarModalBottomSheet(
                          context: context,
                          builder: (context) => SizedBox(
                            height: context.height / 2,
                            child: CustomGiftCardView(giftCard),
                          ),
                        );
                      },
                      tileColor: Theme.of(context).appBarTheme.backgroundColor,
                      title: Text(giftCard.code ?? ''),
                      subtitle: Text(
                        giftCard.orderId ?? '_',
                        style: smallTextStyle?.copyWith(color: lightWhite),
                      ),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(getCurrencyText(giftCard)),
                          Text(DateFormat.yMMMd().format(giftCard.createdAt!)),
                        ],
                      ),
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
