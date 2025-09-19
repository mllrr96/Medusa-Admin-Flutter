import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class ProductTypeTile extends StatelessWidget {
  const ProductTypeTile(this.productType, {super.key, this.onTap});
  final ProductType productType;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(productType.value),
    );
  }
}
