import 'index.dart';



class Notification {
  String? id;
  String? eventName;
  String? resourceType;
  String? resourceId;
  String? customerId;
  Customer? customer;
  String? to;
  Map<String, dynamic>? data;
  List<NotificationResend>? resends;
  String? providerId;
  NotificationProvider? provider;
  DateTime? createdAt;
  DateTime? updatedAt;

  Notification({
    this.id,
    this.eventName,
    required this.resourceType,
    required this.resourceId,
    this.customerId,
    this.customer,
    required this.to,
    this.data,
    this.resends,
    this.providerId,
    this.provider,
    this.createdAt,
    this.updatedAt,
  });

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['event_name'];
    resourceType = json['resource_type'];
    resourceId = json['resource_id'];
    customerId = json['customer_id'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    to = json['to'];
    data = json['data'];
    if (json['resends'] != null) {
      resends = <NotificationResend>[];
      json['resends']
          .forEach((e) => resends!.add(NotificationResend.fromJson(e)));
    }
    providerId = json['provider_id'];
    provider = json['provider'] != null
        ? NotificationProvider.fromJson(json['provider'])
        : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['event_name'] = eventName;
    json['resource_type'] = resourceType;
    json['resource_id'] = resourceId;
    json['customer_id'] = customerId;
    json['customer'] = customer?.toJson() ?? {};
    json['to'] = to;
    json['data'] = data ?? {};
    json['resends'] = resends?.map((e) => e.toJson()).toList() ?? [];
    json['provider_id'] = providerId;
    json['provider'] = provider?.toJson() ?? {};
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    return json;
  }
}
