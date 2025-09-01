import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

extension MoneyAmountExtension on MoneyAmount {
  MoneyAmount forUpdate({
    String? id,
    int? amount,
    String? regionId,
    String? currencyCode,
    int? minQuantity,
    int? maxQuantity,
  }) {
    return MoneyAmount(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      regionId: regionId ?? this.regionId,
      currencyCode: currencyCode ?? this.currencyCode,
      // minQuantity: minQuantity ?? this.minQuantity,
      // maxQuantity: maxQuantity ?? this.maxQuantity,
      //
      // currency: null,
      createdAt: null,
      updatedAt: null,
      deletedAt: null,
      metadata: null,
    );
  }

  MoneyAmount duplicate({
    int? amount,
    String? regionId,
    String? currencyCode,
    int? minQuantity,
    int? maxQuantity,
  }) {
    return MoneyAmount(
      amount: amount ?? this.amount,
      regionId: regionId ?? this.regionId,
      currencyCode: currencyCode ?? this.currencyCode,
      // minQuantity: minQuantity ?? this.minQuantity,
      // maxQuantity: maxQuantity ?? this.maxQuantity,
      //
      id: '',
      createdAt: null,
      updatedAt: null,
      deletedAt: null,
      metadata: null,
    );
  }
}
