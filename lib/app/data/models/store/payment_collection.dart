import 'package:medusa_admin/app/data/models/store/index.dart';

class PaymentCollection {
  /// The payment collection's ID
  final int? id;

  /// Amount of the payment collection.
  final int? amount;

  /// Authorized amount of the payment collection.
  final int? authorizedAmount;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The ID of the user that created the payment collection.
  final String? createdBy;

  /// The 3 character ISO code for the currency.
  ///
  /// Example "usd"
  final String? currencyCode;

  /// Description of the payment collection
  final String? description;

  /// The region's ID
  final String? regionId;

  /// The type of the payment collection
  final PaymentCollectionStatus? status;

  /// The type of the payment collection
  ///
  /// Example "order_edit"
  final String? type;

  /// Regions hold settings for how Customers in a given geographical location shop.
  /// The is, for example, where currencies and tax rates are defined.
  /// A Region can consist of multiple countries to accommodate common shopping settings across countries.
  final Region? region;

  final Currency? currency;

  /// Available if the relation payments is expanded.
  final List<Payment>? payments;

  /// Available if the relation payments is expanded.
  final List<PaymentSession>? paymentSessions;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  PaymentCollection({
    this.currency,
    this.region,
    this.status,
    this.id,
    this.metadata,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.amount,
    this.type,
    this.currencyCode,
    this.description,
    this.payments,
    this.authorizedAmount,
    this.createdBy,
    this.paymentSessions,
    this.regionId,
  });

  factory PaymentCollection.fromJson(Map<String, dynamic> json) {
    return PaymentCollection(
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      currency: json['currency'],
      region: json['region'] != null ? Region.fromJson(json['region']) : null,
      id: json['id'],
      metadata: json['metadata'],
      amount: json['amount'],
      type: json['type'],
      currencyCode: json['currencyCode'],
      description: json['description'],
      payments: json['payments'],
      authorizedAmount: json['authorized_amount'],
      paymentSessions: json['payment_sessions'],
      regionId: json['region_id'],
      createdBy: json['created_by'],
      status: json['status'] != null
          ? PaymentCollectionStatus.values.firstWhere((e) => e.value == (json['type'] ?? ''))
          : null,
    );
  }
}

enum PaymentCollectionStatus {
  notPaid('not_paid'),
  awaiting('awaiting'),
  authorized('authorized'),
  partiallyAuthorized('partially_authorized'),
  canceled('canceled');

  final String value;

  const PaymentCollectionStatus(this.value);
}
