/// AdminCreateProductVariantOrAdminUpdateProductVariantUnion
/// {
///     "oneOf": [
///         {
///             "$ref": "#/components/schemas/AdminCreateProductVariant"
///         },
///         {
///             "$ref": "#/components/schemas/AdminUpdateProductVariant"
///         }
///     ],
///     "runtimeType": "oneOf"
/// }
library;

import 'exports.dart';
part 'admin_create_product_variant_or_admin_update_product_variant_union.freezed.dart';
part 'admin_create_product_variant_or_admin_update_product_variant_union.g.dart'; // AdminCreateProductVariantOrAdminUpdateProductVariantUnion

@freezed
sealed class AdminCreateProductVariantOrAdminUpdateProductVariantUnion
    with _$AdminCreateProductVariantOrAdminUpdateProductVariantUnion {
  const AdminCreateProductVariantOrAdminUpdateProductVariantUnion._();

  @jsonSerializable
  @FreezedUnionValue("AdminCreateProductVariant")
  const factory AdminCreateProductVariantOrAdminUpdateProductVariantUnion.adminCreateProductVariant(
    AdminCreateProductVariant value,
  ) = AdminCreateProductVariantOrAdminUpdateProductVariantUnionAdminCreateProductVariant;

  @jsonSerializable
  @FreezedUnionValue("AdminUpdateProductVariant")
  const factory AdminCreateProductVariantOrAdminUpdateProductVariantUnion.adminUpdateProductVariant(
    AdminUpdateProductVariant value,
  ) = AdminCreateProductVariantOrAdminUpdateProductVariantUnionAdminUpdateProductVariant;

  factory AdminCreateProductVariantOrAdminUpdateProductVariantUnion.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AdminCreateProductVariantOrAdminUpdateProductVariantUnionFromJson(json);
}
