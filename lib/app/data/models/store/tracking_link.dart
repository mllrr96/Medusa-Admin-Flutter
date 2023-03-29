import 'fulfillment.dart';

class TrackingLink {
  final String? id;
  final String? url;
  final String? trackingNumber;
  final String? fulfillmentId;
  final Fulfillment? fulfillment;
  final String? idempotencyKey;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final Map<String, dynamic>? metadata;

  TrackingLink({
    this.id,
    this.url,
    this.trackingNumber,
    this.fulfillmentId,
    this.fulfillment,
    this.idempotencyKey,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory TrackingLink.fromJson(Map<String, dynamic> json) {
    return TrackingLink(
      trackingNumber: json['tracking_number'],
      fulfillmentId: json['fulfillment_id'],
      id: json['id'],
      url: json['url'],
      fulfillment: json['fulfillment'] != null ? Fulfillment.fromJson(json['fulfillment']) : null,
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
      metadata: json['metadata'],
      idempotencyKey: json['idempotency_key'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['url'] = url;
    json['tracking_number'] = trackingNumber;
    json['fulfillment_id'] = fulfillmentId;
    json['fulfillment'] = fulfillment?.toJson();
    json['idempotency_key'] = idempotencyKey;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
