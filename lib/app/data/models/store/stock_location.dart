import 'address.dart';

class StockLocation {
  /// the name of the stock location
  final String? name;

  /// the stock location address ID
  final String? addressId;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  /// The Address of the Stock Location
  final Address? address;

  /// An optional key-value map with additional details
  Map<String, dynamic>? metadata;

  StockLocation({
    this.name,
    this.addressId,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory StockLocation.fromJson(Map<String, dynamic> json) {
    return StockLocation(
      name: json['name'],
      address: Address.fromJson(json['address']),
      addressId: json['address_id'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      metadata: json['metadata'],
    );
  }
}
