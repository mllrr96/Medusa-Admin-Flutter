import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/customers_module/customers/controllers/customers_controller.dart';
import 'package:medusa_admin/app/modules/groups_module/groups/controllers/groups_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_icon.dart';

class CustomersAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomersAppBar({Key? key, required this.tabController, required this.topViewPadding}) : super(key: key);
  final TabController tabController;
  final double topViewPadding;
  @override
  State<CustomersAppBar> createState() => _CustomersAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2 + topViewPadding);
}

class _CustomersAppBarState extends State<CustomersAppBar> {
  bool customersSearch = false;
  final searchNode = FocusNode();
  final controller = CustomersController.instance;
  @override
  Widget build(BuildContext context) {
    const kDuration = Duration(milliseconds: 200);
    final topViewPadding = MediaQuery.of(context).viewPadding.top;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final displayLargeTextStyle = Theme.of(context).textTheme.displayLarge;
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final customersText = Obx(() {
      final count = CustomersController.instance.customersCount.value;
      return Text(count != 0 ? 'Customers ($count)' : 'Customers');
    });
    final customerGroupsText = Obx(() {
      final count = GroupsController.instance.customerGroupsCount.value;
      return Text(count != 0 ? 'Groups ($count)' : 'Groups');
    });
    final androidTabBar = TabBar(controller: widget.tabController, tabs: [
      Tab(
        child: customersText,
      ),
      Tab(child: customerGroupsText)
    ]);

    final iosTabBar = Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        children: [
          CupertinoButton(
              padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
              onPressed: () {
                widget.tabController.index = 0;
                setState(() {});
              },
              alignment: Alignment.bottomCenter,
              child: AnimatedDefaultTextStyle(
                  style: widget.tabController.index == 0
                      ? displayLargeTextStyle!
                      : largeTextStyle!.copyWith(color: lightWhite),
                  duration: const Duration(milliseconds: 200),
                  child: customersText)),
          CupertinoButton(
            padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
            onPressed: () {
              widget.tabController.index = 1;
              setState(() {});
            },
            alignment: Alignment.bottomCenter,
            child: AnimatedDefaultTextStyle(
                style: widget.tabController.index == 1
                    ? displayLargeTextStyle!
                    : largeTextStyle!.copyWith(color: lightWhite),
                duration: const Duration(milliseconds: 200),
                child: customerGroupsText),
          ),
        ],
      ),
    );

    final customersAppBar = AnimatedCrossFade(
        key: const ValueKey(1),
        firstChild: SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              const SizedBox(width: 12.0),
              if (GetPlatform.isIOS)
                Expanded(
                    child: CupertinoSearchTextField(
                  focusNode: searchNode,
                  controller: controller.searchCtrl,
                  placeholder: 'Search for customer name, email, phone number ...',
                  onChanged: (val) {
                    if (controller.searchTerm.value != val && val.isNotEmpty) {
                      controller.searchTerm.value = val;
                    }
                  },
                )),
              if (GetPlatform.isAndroid)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.titleSmall,
                    focusNode: searchNode,
                    controller: controller.searchCtrl,
                    decoration: const InputDecoration(
                      hintText: 'Search for customer name, email, phone number ...',
                    ),
                  ),
                )),
              AdaptiveButton(
                  child: const Text('Cancel'),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    // await Future.delayed(Duration(milliseconds: 150));
                    setState(() {
                      customersSearch = false;
                      controller.searchCtrl.clear();
                      controller.searchTerm.value = '';
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
                      customersSearch = true;
                    });
                    await Future.delayed(kDuration);
                    searchNode.requestFocus();
                  },
                  icon: const Icon(MedusaIcons.magnifying_glass)),
              const SizedBox(width: 6.0),
              AdaptiveIcon(
                  onPressed: () async {
                    final result = await Get.toNamed(Routes.UPDATE_CUSTOMER_DETAILS);
                    if (result is bool) {
                      CustomersController.instance.pagingController.refresh();
                    }
                  },
                  icon: Platform.isIOS ? const Icon(CupertinoIcons.add) : const Icon(Icons.add)),
            ],
          ),
        ),
        crossFadeState: customersSearch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: kDuration);

    final groupsAppBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AdaptiveIcon(
            onPressed: () {}, icon: Platform.isIOS ? const Icon(CupertinoIcons.search) : const Icon(Icons.search)),
        // AdaptiveIcon(
        //     onPressed: () async {
        //       final result = await Get.toNamed(Routes.CREATE_UPDATE_GROUP);
        //       if (result is bool && result) {
        //         GroupsController.instance.pagingController.refresh();
        //       }
        //     },
        //     icon: Platform.isIOS ? const Icon(CupertinoIcons.add) : const Icon(Icons.add))
      ],
    );

    widget.tabController.addListener(() {
      setState(() {});
    });

    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: topViewPadding),
          if (Platform.isAndroid) androidTabBar,
          if (Platform.isIOS) iosTabBar,
          if (widget.tabController.index == 0) SizedBox(height: kToolbarHeight, child: customersAppBar),
          if (widget.tabController.index == 1) SizedBox(height: kToolbarHeight, child: groupsAppBar),
        ],
      ),
    );
  }
}
