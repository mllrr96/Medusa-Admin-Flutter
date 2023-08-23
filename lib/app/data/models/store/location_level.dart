class LocationLevel {
  /// the item location ID
  final String? id;

  /// the total stock quantity of an inventory item at the given location ID
  final num? stockedQuantity;

  /// the reserved stock quantity of an inventory item at the given location ID
  final num? reservedQuantity;

  /// the incoming stock quantity of an inventory item at the given location ID
  final num? incomingQuantity;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  LocationLevel({
    this.id,
    this.stockedQuantity,
    this.reservedQuantity,
    this.incomingQuantity,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory LocationLevel.fromJson(Map<String, dynamic> json) {
    return LocationLevel(
      id: json['id'],
      stockedQuantity: json['stocked_quantity'],
      reservedQuantity: json['reserved_quantity'],
      incomingQuantity: json['incoming_quantity'],
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }
}
