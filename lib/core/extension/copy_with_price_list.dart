import 'package:medusa_admin/data/models/wrapped.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

extension CopyWithPriceList on PriceList {
  PriceList copyWith({
    String? id,
    String? name,
    String? description,
    List<MoneyAmount>? prices,
    Wrapped<List<CustomerGroup>?>? customerGroups,
    PriceListType? type,
    PriceListStatus? status,
    Wrapped<DateTime?>? startsAt,
    Wrapped<DateTime?>? endsAt,
    DateTime? deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PriceList(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      prices: prices ?? this.prices,
      customerGroups: customerGroups!= null ? customerGroups.value: this.customerGroups,
      type: type ?? this.type,
      status: status ?? this.status,
      startsAt: startsAt != null ? startsAt.value : this.startsAt,
      endsAt: endsAt != null ? endsAt.value : this.endsAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
