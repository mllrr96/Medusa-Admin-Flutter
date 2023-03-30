import '../store/line_item.dart';

class UserCreateFulfillmentReq {
  /// The Line Items to include in the Fulfillment.
  final List<LineItem> items;

  /// If set to true no notification will be send related to this Swap.
  final bool? noNotification;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;
  UserCreateFulfillmentReq({
    required this.items,
    this.metadata,
    this.noNotification,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['items'] = items.map((e) => e.toJson()).toList();

    if (metadata != null) {
      json['metadata'] = metadata;
    }

    if (noNotification != null) {
      json['no_notification'] = noNotification;
    }

    return json;
  }
}
