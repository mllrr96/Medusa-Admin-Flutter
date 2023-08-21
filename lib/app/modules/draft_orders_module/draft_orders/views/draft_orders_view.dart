import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/draft_order.dart';
import 'package:medusa_admin/app/modules/medusa_search/controllers/medusa_search_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_icon.dart';
import '../../../components/scrolling_expandable_fab.dart';
import '../../../components/search_text_field.dart';
import '../components/draft_order_card.dart';
import '../controllers/draft_orders_controller.dart';

class DraftOrdersView extends GetView<DraftOrdersController> {
  const DraftOrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton.small(
                onPressed: () => Get.toNamed(Routes.MEDUSA_SEARCH,
                    arguments:
                        SearchReq(searchCategory: SearchCategory.draftOrders)),
                heroTag: 'search Draft Order',
                child:  const Icon(CupertinoIcons.search),
              ),
              const SizedBox(width: 4.0),
            ],
          ),
          const SizedBox(height: 6.0),
          ScrollingExpandableFab(
              controller: controller.scrollController,
              label: 'Draft Order',
              icon: const Icon(Icons.add),
              onPressed: () {},
              heroTag: 'Draft Order'),
        ],
      ),
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS
              ? const ClassicHeader(completeText: '')
              : const MaterialClassicHeader(),
          child: PagedListView.separated(
            padding: const EdgeInsets.fromLTRB(
                12.0, 12.0, 12.0, kToolbarHeight * 2),
            scrollController: controller.scrollController,
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<DraftOrder>(
                itemBuilder: (context, draftOrder, index) =>
                    DraftOrderCard(draftOrder),
                noItemsFoundIndicatorBuilder: (_) =>
                    Center(child: Text(tr.noDraftOrders)),
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive())),
            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
          ),
        ),
      ),
    );
  }
}

class DraftOrdersBottomAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const DraftOrdersBottomAppBar({super.key});

  @override
  State<DraftOrdersBottomAppBar> createState() =>
      _DraftOrdersBottomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DraftOrdersBottomAppBarState extends State<DraftOrdersBottomAppBar> {
  final searchCtrl = TextEditingController();
  final searchNode = FocusNode();
  bool collectionSearch = false;

  @override
  Widget build(BuildContext context) {
    const kDuration = Duration(milliseconds: 200);
    // final controller = DraftOrdersController.instance;
    // final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: AnimatedCrossFade(
          key: const ValueKey(1),
          firstChild: SizedBox(
            height: kToolbarHeight,
            child: Row(
              children: [
                const SizedBox(width: 12.0),
                Expanded(
                  child: SearchTextField(
                    focusNode: searchNode,
                    controller: searchCtrl,
                    hintText: 'Search for product name, variant title ...',
                  ),
                ),
                AdaptiveButton(
                    child: const Text('Cancel'),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      // await Future.delayed(Duration(milliseconds: 150));
                      setState(() {
                        collectionSearch = false;
                        // if (controller.searchTerm.isNotEmpty) {
                        //   controller.searchTerm = '';
                        //   controller.pagingController.refresh();
                        // }
                        searchCtrl.clear();
                      });
                    }),
              ],
            ),
          ),
          secondChild: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdaptiveIcon(
                    onPressed: () async {
                      setState(() {
                        collectionSearch = true;
                      });
                      await Future.delayed(kDuration);
                      searchNode.requestFocus();
                    },
                    icon: const Icon(MedusaIcons.magnifying_glass)),
              ],
            ),
          ),
          crossFadeState: collectionSearch
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: kDuration),
    );
  }
}
