import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer_group.dart';
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
      onTap: ()=> FocusScope.of(context).unfocus(),
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
    final searchTerm = controller.searchTerm.value;
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      alignment: Alignment.center,
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SearchTextField(
        controller: controller.searchCtrl,
        hintText: 'Search for group name ...',
        onSuffixTap: () {
          controller.searchCtrl.clear();
          controller.searchTerm.value = '';
          FocusScope.of(context).unfocus();
        },
        onChanged: (val) {
          if (val.isEmpty && searchTerm.isNotEmpty) {
            controller.searchTerm.value = '';
          }

          if (searchTerm != val && val.isNotEmpty) {
            controller.searchTerm.value = val;
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
