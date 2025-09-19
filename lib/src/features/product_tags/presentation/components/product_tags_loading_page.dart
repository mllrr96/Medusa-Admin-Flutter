import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';

class ProductTagsLoadingPage extends StatelessWidget {
  const ProductTagsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorManager.primary,
      ),
    );
  }
}
