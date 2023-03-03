import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/collections_controller.dart';

class CollectionsView extends GetView<CollectionsController> {
  const CollectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        centerTitle: true,
        actions: [AdaptiveIcon(onPressed: () => Get.toNamed(Routes.CREATE_COLLECTION), icon: const Icon(Icons.add))],
      ),
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
          child: PagedListView.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<ProductCollection>(
              itemBuilder: (context, collection, index) => ListTile(
                onTap: () => Get.toNamed(Routes.COLLECTION_DETAILS, arguments: collection.id!),
                title: Text(collection.title ?? '', style: largeTextStyle),
                subtitle: Text('/${collection.handle ?? ''}', style: smallTextStyle),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (collection.updatedAt != null)
                      Text(DateFormat.yMMMd().format(collection.updatedAt!), style: smallTextStyle),
                    if (collection.products != null)
                      Text('Products: ${collection.products?.length ?? ''}', style: smallTextStyle),
                  ],
                ),
              ),
              firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator.adaptive()),
              noItemsFoundIndicatorBuilder: (_) => Center(child: Text('No products found', style: largeTextStyle)),
            ),
            separatorBuilder: (_, __) =>
                GetPlatform.isAndroid ? const Divider(height: 0) : const Divider(height: 0, indent: 12.0),
          ),
        ),
      ),
    );
  }
}
