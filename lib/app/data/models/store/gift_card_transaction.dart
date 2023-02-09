
import 'gift_card.dart';
import 'order.dart';

class GiftCardTransaction {
  String? id;
  String? giftCardId;
  GiftCard? giftCard;
  String? orderId;
  Order? order;
  int? amount;
  DateTime? createdAt;
  bool? isTaxable;
  num? taxRate;

  GiftCardTransaction({
    this.id,
    required this.giftCardId,
    this.giftCard,
    this.orderId,
    this.order,
    required this.amount,
    this.createdAt,
    this.isTaxable,
    this.taxRate,
  });

  GiftCardTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    giftCardId = json['gift_card_id'];
    giftCard =
        json['gift_card'] != null ? GiftCard.fromJson(json['gift_card']) : null;
    orderId = json['order_id'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    amount = json['amount'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    isTaxable = json['is_taxable'];
    taxRate = json['tax_rate'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['gift_card_id'] = giftCardId;
    json['gift_card'] = giftCard?.toJson();
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['amount'] = amount;
    json['created_at'] = createdAt.toString();
    json['is_taxable'] = isTaxable;
    json['tax_rate'] = taxRate;
    return json;
  }
}
