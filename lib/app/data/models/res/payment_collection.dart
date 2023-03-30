import '../store/payment_collection.dart';

class UserRetrievePaymentCollectionRes {
  final PaymentCollection? paymentCollection;

  UserRetrievePaymentCollectionRes(this.paymentCollection);

  factory UserRetrievePaymentCollectionRes.fromJson(Map<String, dynamic> json) {
    return UserRetrievePaymentCollectionRes(
        json['payment_collection'] != null ? PaymentCollection.fromJson(json['payment_collection']) : null);
  }
}

class UserDeletePaymentCollectionRes {
  /// The ID of the deleted Payment Collection.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "payment_collection"
  final String? object;

  /// Whether or not the Payment Collection was deleted.
  final bool deleted;

  UserDeletePaymentCollectionRes({required this.deleted, this.id, this.object});

  factory UserDeletePaymentCollectionRes.fromJson(json) {
    return UserDeletePaymentCollectionRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}
