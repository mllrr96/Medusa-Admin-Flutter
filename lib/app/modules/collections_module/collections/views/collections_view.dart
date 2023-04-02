import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../components/collection_list_tile.dart';
import '../controllers/collections_controller.dart';

class CollectionsView extends GetView<CollectionsController> {
  const CollectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
          child: PagedListView(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<ProductCollection>(
              itemBuilder: (context, collection, index) => CollectionListTile(collection,
                  tileColor: index.isOdd ? Theme.of(context).appBarTheme.backgroundColor : null),
              firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator.adaptive()),
              noItemsFoundIndicatorBuilder: (_) => Center(
                  child: Text('No collections yet!\n Tap on + to add new collection',
                      style: largeTextStyle, textAlign: TextAlign.center)),
            ),
            // separatorBuilder: (_, __) =>
            //     GetPlatform.isAndroid ? const Divider(height: 0) : const Divider(height: 0, indent: 16.0),
          ),
        ),
      ),
    );
  }
}
