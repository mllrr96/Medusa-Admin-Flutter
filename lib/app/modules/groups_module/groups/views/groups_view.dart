import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer_group.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import '../../../components/search_text_field.dart';
import '../../../medusa_search/controllers/medusa_search_controller.dart';
import '../components/group_card.dart';
import '../controllers/groups_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupsView extends GetView<GroupsController> {
  const GroupsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    final mediumTextStyle = context.bodyMedium;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.small(
                  onPressed: () => Get.toNamed(Routes.MEDUSA_SEARCH,
                      arguments:
                          SearchReq(searchCategory: SearchCategory.groups)),
                  heroTag: UniqueKey(),
                  child: const Icon(CupertinoIcons.search),
                ),
                const SizedBox(width: 4.0),
              ],
            ),
            const SizedBox(height: 6.0),
            ScrollingExpandableFab(
              // heroTag: UniqueKey(),
              controller: controller.scrollController, label: 'New Group',
              icon: const Icon(Icons.group_add),
              onPressed: () async {
                final result = await Get.toNamed(Routes.CREATE_UPDATE_GROUP);
                if (result is bool && result) {
                  GroupsController.instance.pagingController.refresh();
                }
              },
            ),
          ],
        ),
        body: SlidableAutoCloseBehavior(
          child: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: () => controller.pagingController.refresh(),
            header: GetPlatform.isIOS
                ? const ClassicHeader(completeText: '')
                : const MaterialClassicHeader(),
            child: PagedListView.separated(
              scrollController: controller.scrollController,
              separatorBuilder: (_, __) =>
                  Divider(height: 0, indent: GetPlatform.isIOS ? 16.0 : 0),
              padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<CustomerGroup>(
                itemBuilder: (context, customerGroup, index) =>
                    GroupCard(customerGroup: customerGroup, index: index),
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                noItemsFoundIndicatorBuilder: (_) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (controller.searchTerm.value.isEmpty)
                      Text(tr.noGroups, style: mediumTextStyle),
                    if (controller.searchTerm.value.isNotEmpty)
                      Text(tr.noGroupsFound, style: mediumTextStyle),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GroupAppBar extends GetView<GroupsController>
    implements PreferredSizeWidget {
  const GroupAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      alignment: Alignment.center,
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Expanded(
            child: SearchTextField(
              controller: controller.searchCtrl,
              focusNode: controller.focusNode,
              hintText: tr.groupsSearchHint,
              onSuffixTap: () {
                controller.searchCtrl.clear();
                controller.searchTerm.value = '';
              },
              onChanged: (val) {
                if (val.isEmpty && controller.searchTerm.value.isNotEmpty) {
                  controller.searchTerm.value = '';
                }
                if (controller.searchTerm.value != val && val.isNotEmpty) {
                  controller.searchTerm.value = val;
                }
              },
            ),
          ),
          Obx(() {
            return AnimatedCrossFade(
              sizeCurve: Curves.ease,
              firstChild: AdaptiveButton(
                  onPressed: () {
                    controller.focusNode.unfocus();
                    controller.searchCtrl.clear();
                    if (controller.searchTerm.value.isNotEmpty) {
                      controller.searchTerm.value = '';
                    }
                  },
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(tr.cancel, maxLines: 1)),
              secondChild: const SizedBox.shrink(),
              crossFadeState: controller.focused.value
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 250),
            );
          }),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
