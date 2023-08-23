

import 'index.dart';

class NotificationResend {
  String? id;
  String? eventName;
  String? resourceType;
  String? resourceId;
  String? customerId;
  Customer? customer;
  String? to;
  String? data;
  String? parentId;
  Notification? parentNotification;
  String? providerId;
  NotificationProvider? provider;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotificationResend({
    this.id,
    this.eventName,
    this.resourceType,
    this.resourceId,
    this.customerId,
    this.customer,
    this.to,
    this.data,
    this.parentId,
    this.parentNotification,
    this.providerId,
    this.provider,
    this.createdAt,
    this.updatedAt,
  });

  NotificationResend.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['event_name'];
    resourceType = json['resource_type'];
    resourceId = json['resource_id'];
    customerId = json['customer_id'];
    customer =
    json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    to = json['to'];
    data = json['data'];
    parentId = json['parent_id'];
    parentNotification = json['parent_notification'] != null
        ? Notification.fromJson(json['parent_notification'])
        : null;
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
    json['customer'] = customer?.toJson();
    json['to'] = to;
    json['data'] = data;
    json['parent_id'] = parentId;
    json['parent_notification'] = parentNotification?.toJson();
    json['provider_id'] = providerId;
    json['provider'] = provider?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    return json;
  }
}
