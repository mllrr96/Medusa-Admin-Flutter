class InventoryItem {
  /// The Stock Keeping Unit (SKU) code of the Inventory Item.
  final String? sku;

  /// The Harmonized System code of the Inventory Item.
  /// May be used by Fulfillment Providers to pass customs information to shipping carriers.
  final String? hsCode;

  /// The Manufacturers Identification code that identifies the manufacturer of the Inventory Item.
  /// May be used by Fulfillment Providers to pass customs information to shipping carriers.
  final String? midCode;

  /// The country in which the Inventory Item was produced.
  /// May be used by Fulfillment Providers to pass customs information to shipping carriers.
  final String? originCountry;

  /// The material and composition that the Inventory Item is made of,
  /// May be used by Fulfillment Providers to pass customs information to shipping carriers.
  final String? material;

  /// The weight of the Inventory Item. May be used in shipping rate calculations.
  final num? weight;

  /// The height of the Inventory Item. May be used in shipping rate calculations.
  final num? height;

  /// The width of the Inventory Item. May be used in shipping rate calculations.
  final num? width;

  /// The length of the Inventory Item. May be used in shipping rate calculations.
  final num? length;

  /// Whether the item requires shipping.
  final bool? requiresShipping;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  InventoryItem({
    this.metadata,
    this.deletedAt,
    this.updatedAt,
    this.createdAt,
    this.length,
    this.material,
    this.height,
    this.originCountry,
    this.hsCode,
    this.midCode,
    this.weight,
    this.width,
    this.sku,
    this.requiresShipping,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      sku: json['sku'],
      width: json['width'],
      height: json['height'],
      length: json['length'],
      weight: json['weight'],
      material: json['material'],
      originCountry: json['origin_country'],
      requiresShipping: json['requires_shipping'],
      metadata: json['metadata'],
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      hsCode: json['hs_code'],
      midCode: json['mid_code'],
    );
  }
}
