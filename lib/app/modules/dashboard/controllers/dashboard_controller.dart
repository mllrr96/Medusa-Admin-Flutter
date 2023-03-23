import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find<DashboardController>();
  final pages = <String>[Routes.ORDERS, Routes.PRODUCTS, Routes.CUSTOMERS, Routes.STORE_SETTINGS];
  int currentScreen = 0;
  final bottomNavBarItems = GetPlatform.isIOS
      ? const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.money_dollar), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.tag), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Customers'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.add), label: 'More'),
        ]
      : const [
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.tag), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Customers'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ];




  void onTap(int index) {
    currentScreen = index;
    update();
  }
}
