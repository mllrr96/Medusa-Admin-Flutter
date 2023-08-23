class Refund {
  String? id;
  String? orderId;
  int? amount;
  String? note;
  RefundReason? reason;
  String? idempotencyKey;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  Refund({
    this.id,
    required this.orderId,
    required this.amount,
    this.note,
    this.reason,
    this.idempotencyKey,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const <String, dynamic>{},
  });

  Refund.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    amount = json['amount'];
    note = json['note'];
    reason = json['reason'] != null
        ? RefundReason.values
            .firstWhere((e) => e.value == (json['reason'] ?? ''))
        : null;
    idempotencyKey = json['idempotency_key'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['order_id'] = orderId;
    json['amount'] = amount;
    json['note'] = note;
    json['reason'] = reason?.value;
    json['idempotency_key'] = idempotencyKey;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

enum RefundReason {
  discount('discount'),
  returns('return'),
  swap('swap'),
  claim('claim'),
  other('other');

  final String value;

  const RefundReason(this.value);
}
