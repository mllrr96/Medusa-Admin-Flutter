import 'index.dart';

class ProductOptionValue {
  String? id;
  String? value;
  String? optionId;
  ProductOption? option;
  String? variantId;
  ProductVariant? variant;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic>? metadata;

  ProductOptionValue({
    this.id,
    this.value,
    this.optionId,
    this.option,
    this.variantId,
    this.variant,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  ProductOptionValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    optionId = json['option_id'];
    option = json['option'] != null ? ProductOption.fromJson(json) : null;
    variantId = json['variant_id'];
    variant = json['variant'] != null ? ProductVariant.fromJson(json) : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['value'] = value;

    if (id != null) {
      json['id'] = id;
    }
    if (optionId != null) {
      json['option_id'] = optionId;
    }
    if (option != null) {
      json['option'] = option?.toJson();
    }

    if (variantId != null) {
      json['variant_id'] = variantId;
    }
    if (variant != null) {
      json['variant'] = variant?.toJson();
    }
    if (createdAt != null) {
      json['created_at'] = createdAt.toString();
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt.toString();
    }
    if (deletedAt != null) {
      json['deleted_at'] = deletedAt.toString();
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }
    return json;
  }
}
