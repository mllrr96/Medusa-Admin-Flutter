import 'package:medusa_admin/app/data/models/store/index.dart';

class UserPaymentRes {
  final Payment? payment;

  UserPaymentRes(this.payment);

  factory UserPaymentRes.fromJson(Map<String, dynamic> json) =>
      UserPaymentRes(json['payment'] != null ? Payment.fromJson(json['payment']) : null);
}

class UserCreateRefundPaymentRes {
  /// The amount to refund.
  final int amount;

  /// The reason for the Refund.
  final String reason;

  /// A note with additional details about the Refund.
  final String? note;

  UserCreateRefundPaymentRes({
    required this.amount,
    required this.reason,
    this.note,
  });

  factory UserCreateRefundPaymentRes.fromJson(Map<String, dynamic> json) {
    return UserCreateRefundPaymentRes(amount: json['amount'], reason: json['reason'], note: json['note']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['amount'] = amount;
    json['reason'] = reason;
    if (note != null) {
      json['note'] = note;
    }
    return json;
  }
}
