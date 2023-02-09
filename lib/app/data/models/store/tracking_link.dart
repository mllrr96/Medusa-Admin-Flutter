
import 'fulfillment.dart';

class TrackingLink {
  String? id;
  String? url;
  String? trackingNumber;
  String? fulfillmentId;
  Fulfillment? fulfillment;
  String? idempotencyKey;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  TrackingLink({
    this.id,
    this.url,
    required this.trackingNumber,
    required this.fulfillmentId,
    this.fulfillment,
    this.idempotencyKey,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const <String, dynamic>{},
  });

  TrackingLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    trackingNumber = json['tracking_number'];
    fulfillmentId = json['fulfillment_id'];
    //TODO: parse fulfillment object - json['fulfillment']
    idempotencyKey = json['idempotency_key'];
    createdAt = DateTime.tryParse(json['created_at'] ?? {});
    updatedAt = DateTime.tryParse(json['updated_at'] ?? {});
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? {});
    metadata = json['metadata'] ?? <String, dynamic>{};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['url'] = url;
    json['tracking_number'] = trackingNumber;
    json['fulfillment_id'] = fulfillmentId;
    //TODO: implement fulfillment toJson
    json['idempotency_key'] = idempotencyKey;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }

//TODO: TrackingLink: add fields, fromJson, toJson
}
