import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer_group.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../components/search_text_field.dart';
import '../components/group_card.dart';
import '../controllers/groups_controller.dart';

class GroupsView extends GetView<GroupsController> {
  const GroupsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Get.toNamed(Routes.CREATE_UPDATE_GROUP);
            if (result is bool && result) {
              GroupsController.instance.pagingController.refresh();
            }
          },
          child: const Icon(Icons.group_add),
        ),
        body: Scaffold(
          appBar: GroupAppBar(),
          body: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: () => controller.pagingController.refresh(),

            header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
            child: PagedListView(
              padding: const EdgeInsets.only(bottom: kToolbarHeight *1.4),
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<CustomerGroup>(
                  itemBuilder: (context, customerGroup, index) => GroupCard(customerGroup: customerGroup, index: index),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive())),
              // separatorBuilder: (_, __) => const Divider(height: 0),
            ),
          ),
        ),
      ),
    );
  }
}

class GroupAppBar extends GetView<GroupsController> with PreferredSizeWidget {
  const GroupAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
              hintText: 'Search for group name ...',
              onSuffixTap: () {
                controller.searchCtrl.clear();
                controller.searchTerm.value = '';
              },
              onChanged: (val) {
                if (val.isEmpty && controller.searchTerm.value.isNotEmpty) {
                  print('check');
                  controller.searchTerm.value = '';
                }

                if (controller.searchTerm.value != val && val.isNotEmpty) {
                  print('check');
                  controller.searchTerm.value = val;
                }
              },
            ),
          ),
          // AnimatedSwitcher(
          //   duration: const Duration(milliseconds: 250),
          //   child: controller.focusNode.hasFocus
          //       ? AdaptiveButton(
          //           onPressed: () {
          //             controller.focusNode.unfocus();
          //           },
          //           padding: const EdgeInsets.only(left: 12.0),
          //           child: const Text('Cancel'))
          //       : const SizedBox.shrink(),
          // ),
          Obx(() {
            return AnimatedCrossFade(
              sizeCurve: Curves.ease,
              firstChild: AdaptiveButton(
                  onPressed: () {
                    controller.focusNode.unfocus();
                    controller.searchCtrl.clear();
                    controller.searchTerm.value = '';
                  },
                  padding: const EdgeInsets.only(left: 12.0),
                  child: const Text('Cancel', maxLines: 1)),
              secondChild: const SizedBox.shrink(),
              crossFadeState: controller.focused.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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
