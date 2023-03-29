class Reservation {
  /// The id of the reservation item
  final String? id;

  /// The id of the location of the reservation
  final String? locationId;

  /// The id of the inventory item the reservation relates to
  final String? inventoryItemId;
  final int? quantity;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  Reservation({
    this.id,
    this.locationId,
    this.inventoryItemId,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      locationId: json['location_id'],
      inventoryItemId: json['inventory_item_id'],
      quantity: json['quantity'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }

    if (locationId != null) {
      json['location_id'] = locationId;
    }

    if (quantity != null) {
      json['quantity'] = quantity;
    }

    if (inventoryItemId != null) {
      json['inventory_item_id'] = inventoryItemId;
    }

    if (createdAt != null) {
      json['createdAt'] = createdAt.toString();
    }

    if (updatedAt != null) {
      json['updatedAt'] = updatedAt.toString();
    }

    if (deletedAt != null) {
      json['deletedAt'] = deletedAt.toString();
    }

    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}
