import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/customers_module/customers/controllers/customers_controller.dart';

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
  @override
  Widget build(BuildContext context) {
    final topViewPadding = MediaQuery.of(context).viewPadding.top;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final displayLargeTextStyle = Theme.of(context).textTheme.displayLarge;
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final customersText = Obx(() {
     final count =  CustomersController.instance.customersCount.value;
      return Text(count != 0 ?'Customers ($count)': 'Customers');
    });
    final androidTabBar =
        TabBar(controller: widget.tabController, tabs:  [Tab(child: customersText,), const Tab(text: 'Groups')]);

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
                child: const Text('Groups')),
          ),
        ],
      ),
    );

    final customersAppBar = AdaptiveIcon(
        onPressed: () {}, icon: Platform.isIOS ? const Icon(CupertinoIcons.search) : const Icon(Icons.search));

    final groupsAppBar = Row(
      children: [
        AdaptiveIcon(onPressed: () {}, icon: Platform.isIOS ? const Icon(CupertinoIcons.add) : const Icon(Icons.add))
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
          if (widget.tabController.index == 0) customersAppBar,
          if (widget.tabController.index == 1) groupsAppBar,
        ],
      ),
    );
  }
}
