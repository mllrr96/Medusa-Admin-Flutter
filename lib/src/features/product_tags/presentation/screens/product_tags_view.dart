import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductTagsView extends StatelessWidget {
  const ProductTagsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Tags'),
      ),
      body: const Center(
        child: Text('Product Tags View'),
      ),
    );
  }
}
