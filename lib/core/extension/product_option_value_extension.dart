import 'package:medusa_admin_flutter/medusa_admin.dart';

extension ProductOptionValueExtension on ProductOptionValue {
  ProductOptionValue forUpdate() {
    return ProductOptionValue(
      value: value,
      optionId: optionId,
      variantId: null,
      variant: null,
      option: null,
      id: null,
      createdAt: null,
      updatedAt: null,
      deletedAt: null,
      metadata: null,
    );
  }
}
