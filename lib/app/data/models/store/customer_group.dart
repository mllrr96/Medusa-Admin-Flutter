import 'package:equatable/equatable.dart';
import 'package:medusa_admin/app/data/models/store/price_list.dart';
import 'customer.dart';

class CustomerGroup extends Equatable {
  final String? id;
  final String? name;
  final List<Customer>? customers;
  final List<PriceList>? priceLists;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final Map<String, dynamic>? metadata;

  const CustomerGroup({
    this.id,
    required this.name,
    this.customers,
    this.priceLists,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory CustomerGroup.fromJson(Map<String, dynamic> json) {
    List<Customer>? customers = [];
    List<PriceList>? priceLists = [];
    if (json['customers'] != null) {
      customers = <Customer>[];
      json['customers'].forEach((element) => customers!.add(Customer.fromJson(element)));
    } else {
      customers = null;
    }
    if (json['price_lists'] != null) {
      priceLists = <PriceList>[];
      json['price_lists'].forEach((element) => priceLists!.add(PriceList.fromJson(element)));
    } else {
      priceLists = null;
    }

    return CustomerGroup(
      name: json['name'],
      id: json['id'],
      customers: customers,
      priceLists: priceLists,
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['name'] = name;
    json['id'] = id;
    json['customers'] = customers?.map((e) => e.toJson()).toList() ?? [];
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }

  @override
  List<Object?> get props =>[id,name,customers,createdAt,updatedAt,deletedAt, metadata,priceLists,];
}
