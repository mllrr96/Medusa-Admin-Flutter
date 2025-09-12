import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';

@RoutePage()
class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      drawer: const AppDrawer(),
      drawerEdgeDragWidth: context.drawerEdgeDragWidth,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        },
        label: const Text('New Inventory'),
        icon: const Icon(LucideIcons.plus),
      ),
      body: Center(
        child: Text('Inventory View'),
      ),
    );
  }
}
