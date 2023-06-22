import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/gift_card.dart';

class UserGiftCardRes {
  final GiftCard? giftCard;
  UserGiftCardRes(this.giftCard);

  factory UserGiftCardRes.fromJson(Map<String, dynamic> json) {
    return UserGiftCardRes(json['gift_card'] != null ? GiftCard.fromJson(json['gift_card']) : null);
  }
}

class UserGiftCardsRes extends PaginatedResponse {
  List<GiftCard>? giftCards;

  UserGiftCardsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['gift_cards'] == null) return;
    giftCards = <GiftCard>[];

    json['gift_cards'].forEach((v) => giftCards!.add(GiftCard.fromJson(v)));
  }
}

class UserDeleteGiftCardRes{
  /// The ID of the deleted Gift Card
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "gift_card"
  final String? object;

  /// Whether the gift card was deleted successfully or not.
  final bool deleted;
  UserDeleteGiftCardRes({required this.deleted, this.id, this.object});
  factory UserDeleteGiftCardRes.fromJson(json) {
    return UserDeleteGiftCardRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}