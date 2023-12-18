import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // context.popRoute();
              context.tabsRouter.setActiveIndex(0);
            },
            leading: const Icon(Icons.tab),
            title: const Text('Orders'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // context.popRoute();
              context.tabsRouter.setActiveIndex(1);
            },
            leading: const Icon(Icons.tab),
            title: const Text('Draft orders'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // context.popRoute();
              context.tabsRouter.setActiveIndex(2);
            },
            leading: const Icon(Icons.tab),
            title: const Text('Products'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // context.popRoute();
              context.tabsRouter.setActiveIndex(3);
            },
            leading: const Icon(Icons.tab),
            title: const Text('Collections'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // context.popRoute();
              context.tabsRouter.setActiveIndex(4);
            },
            leading: const Icon(Icons.tab),
            title: const Text('Customers'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // context.popRoute();
              context.tabsRouter.setActiveIndex(5);
            },
            leading: const Icon(Icons.tab),
            title: const Text('Groups'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // context.popRoute();
              context.tabsRouter.setActiveIndex(6);
            },
            leading: const Icon(Icons.tab),
            title: const Text('Discounts'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // context.popRoute();
              context.tabsRouter.setActiveIndex(7);
            },
            leading: const Icon(Icons.tab),
            title: const Text('Price lists'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // context.popRoute();
              // context.tabsRouter.setActiveIndex(7);
            },
            leading: const Icon(Icons.tab),
            title: const Text('App Settings'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // context.popRoute();
              // context.tabsRouter.setActiveIndex(7);
            },
            leading: const Icon(Icons.tab),
            title: const Text('Store Settings'),
          ),
        ],
      ),
    );
  }
}
