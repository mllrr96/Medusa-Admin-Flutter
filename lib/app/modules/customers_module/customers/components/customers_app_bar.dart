import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/customers_module/customers/controllers/customers_controller.dart';
import 'package:medusa_admin/app/modules/groups_module/groups/controllers/groups_controller.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../core/utils/colors.dart';

class CustomersGroupsTabBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomersGroupsTabBar({Key? key, required this.tabController, required this.topViewPadding}) : super(key: key);
  final TabController tabController;
  final double topViewPadding;
  @override
  State<CustomersGroupsTabBar> createState() => _CustomersGroupsTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2 + topViewPadding);
}

class _CustomersGroupsTabBarState extends State<CustomersGroupsTabBar> {
  var activeIndex = 0;
  @override
  void initState() {
    if (Platform.isIOS) {
      widget.tabController.addListener(() {
        setState(() {
          activeIndex = widget.tabController.index;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topViewPadding = context.topViewPadding;

    final lightWhite = ColorManager.manatee;
    final largeTextStyle = context.bodyLarge;

    final headlineMediumTextStyle = context.headlineMedium;

    final tr = context.tr;

    final customersText = Obx(() {
      final count = CustomersController.instance.customersCount.value;
      return Text(count != 0 ? '${tr.customers} ($count)' : tr.customers);
    });
    final customerGroupsText = Obx(() {
      final count = GroupsController.instance.customerGroupsCount.value;
      return Text(count != 0 ? '${tr.groups} ($count)' : tr.groups);
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
                  style: activeIndex == 0 ? headlineMediumTextStyle! : largeTextStyle!.copyWith(color: lightWhite),
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
                style: activeIndex == 1 ? headlineMediumTextStyle! : largeTextStyle!.copyWith(color: lightWhite),
                duration: const Duration(milliseconds: 200),
                child: customerGroupsText),
          ),
        ],
      ),
    );
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Gap(topViewPadding),
          if (Platform.isAndroid) androidTabBar,
          if (Platform.isIOS) iosTabBar,
        ],
      ),
    );
  }
}
