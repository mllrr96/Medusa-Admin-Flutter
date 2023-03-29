import '../common/item.dart';

class UserReceiveReturnOrderReq {
  UserReceiveReturnOrderReq({required this.items, this.refund});

  /// The Line Items that have been received.
  final List<Item> items;

  /// The amount to refund.
  final int? refund;

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['items'] = items.map((e) => e.toJson()).toList();

    if (refund != null) {
      json['refund'] = refund;
    }

    return json;
  }
}
