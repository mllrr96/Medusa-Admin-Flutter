import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';

@RoutePage()
class ReservationsView extends StatelessWidget {
  const ReservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations'),
      ),
      drawer: const AppDrawer(),
      drawerEdgeDragWidth: context.drawerEdgeDragWidth,
      body: Center(
        child: Text('Reservations View'),
      ),
    );
  }
}
