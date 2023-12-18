import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../routes/app_pages.dart';
import '../../../medusa_search/controllers/medusa_search_controller.dart';
import '../components/collection_list_tile.dart';
import '../controllers/collections_controller.dart';
@RoutePage()
class CollectionsView extends GetView<CollectionsController> {
  const CollectionsView({super.key});
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;

    return Scaffold(
      // appBar: const CollectionsAppBar(),
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
                    SearchReq(searchCategory: SearchCategory.collections)),
                heroTag: 'search collection',
                child:  const Icon(CupertinoIcons.search),
              ),
              const SizedBox(width: 4.0),
            ],
          ),
          const SizedBox(height: 6.0),
          ScrollingExpandableFab(controller: controller.scrollController, label: 'New Collection', icon: const Icon(Icons.add)
          ,onPressed: () => Get.toNamed(Routes.CREATE_COLLECTION),),
        ],
      ),
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
          child: PagedListView(
            scrollController: controller.scrollController,
            pagingController: controller.pagingController,
            padding: const EdgeInsets.only(bottom: kToolbarHeight),
            builderDelegate: PagedChildBuilderDelegate<ProductCollection>(
              itemBuilder: (context, collection, index) => CollectionListTile(collection,
                  tileColor: index.isOdd ? Theme.of(context).appBarTheme.backgroundColor : null),
              firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator.adaptive()),
              noItemsFoundIndicatorBuilder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (controller.searchTerm.value.isEmpty)
                    Column(
                      children: [
                        Text('No collection', style: largeTextStyle, textAlign: TextAlign.center),
                        const SizedBox(height: 12.0),
                        AdaptiveFilledButton(
                            onPressed: () => Get.toNamed(Routes.CREATE_COLLECTION),
                            child: const Text('Add collection', style: TextStyle(color: Colors.white)))
                      ],
                    ),
                  if (controller.searchTerm.value.isNotEmpty) Text('No collections found', style: mediumTextStyle),
                ],
              ),
            ),
            // separatorBuilder: (_, __) =>
            //     GetPlatform.isAndroid ? const Divider(height: 0) : const Divider(height: 0, indent: 16.0),
          ),
        ),
      ),
    );
  }
}
