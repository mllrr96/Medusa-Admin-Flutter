import 'index.dart';

class Notification implements Comparable {
  /// The notification's id
  final String? id;

  /// The name of the event that the notification was sent for.
  final String? eventName;

  /// The type of resource that the notification refers to.
  final String? resourceType;

  /// The id of the resource that the notification refers to.
  final String? resourceId;

  /// The id of the customer that this notification was sent to.
  final String? customerId;

  /// The date with timezone at which the resource was updated.
  final Customer? customer;

  /// The address that the notification was sent to. this will usually be an email address, but can represent other addresses such as a chat bot user id.
  final String? to;

  /// The data that the notification was sent with. this contains all the data necessary for the notification provider to initiate a resend.
  final Map<String, dynamic>? data;

  /// The details of all resends of the notification.
  final List<NotificationResend>? resends;

  /// The details of the parent notification.
  final Notification? parentNotification;

  /// The id of the notification provider used to send the notification.
  final String? providerId;

  /// The notification's parent id.
  final String? parentId;

  /// The notification provider used to send the notification.
  final NotificationProvider? provider;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

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
    this.parentId,
    this.parentNotification,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    List<NotificationResend>? resends;
    if (json['resends'] != null) {
      resends = <NotificationResend>[];
      json['resends'].forEach((e) => resends!.add(NotificationResend.fromJson(e)));
    }
    return Notification(
      resourceType: json['resource_type'],
      resourceId: json['resource_id'],
      to: json['to'],
      customerId: json['customer_id'],
      customer: json['customer'] != null ? Customer.fromJson(json['customer']) : null,
      eventName: json['event_name'],
      id: json['id'],
      data: json['data'],
      providerId: json['provider_id'],
      provider: json['provider'] != null ? NotificationProvider.fromJson(json['provider']) : null,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      resends: resends,
      parentId: json['parent_id'],
      parentNotification:
          json['parent_notification'] != null ? Notification.fromJson(json['parent_notification']) : null,
    );
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
    json['resends'] = resends?.map((e) => e.toJson()).toList();
    json['provider_id'] = providerId;
    json['parent_id'] = parentId;
    json['provider'] = provider?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['parent_id'] = parentId;
    return json;
  }

  @override
  int compareTo(other) {
    if (createdAt == null || other == null || other.createdAt == null) {
      return 0;
    }

    final a = createdAt;
    DateTime? b;
    if (other is OrderEdit) {
      b = other.confirmedAt ?? other.declinedAt ?? other.requestedAt ?? other.canceledAt;
    } else if (other is Note) {
      b = other.createdAt;
    } else if (other is Notification) {
      b = other.createdAt;
    } else if (other is Refund) {
      b = other.createdAt;
    }
    if (a == null || b == null) {
      return 0;
    }

    if (a.isAfter(b)) {
      return -1;
    }

    if (a.isBefore(b)) {
      return 1;
    }
    return 0;
  }
}
