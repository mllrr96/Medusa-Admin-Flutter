import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class ProductTagTile extends StatelessWidget {
  const ProductTagTile(this.productTag, {super.key, this.onTap});
  final ProductTag productTag;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(productTag.value),
    );
  }
}
