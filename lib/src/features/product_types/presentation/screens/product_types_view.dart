
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';

@RoutePage()
class ProductTypesView extends StatelessWidget {
  const ProductTypesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Types'),
      ),
      body: const Center(
        child: Text('Product Types View'),
      ),
    );
  }
}
