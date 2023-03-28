class Reservation {
  /// The id of the reservation item
  final String? id;

  /// The id of the location of the reservation
  final String? locationId;

  /// The id of the inventory item the reservation relates to
  final String? inventoryItemId;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
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
}
