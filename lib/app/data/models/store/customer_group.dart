import 'package:medusa_admin/app/data/models/store/price_list.dart';
import 'customer.dart';

class CustomerGroup {
  String? id;
  String? name;
  List<Customer>? customers;
  List<PriceList>? priceLists;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic>? metadata;

  CustomerGroup({
    this.id,
    required this.name,
    this.customers,
    this.priceLists,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  CustomerGroup.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['customers'] != null) {
      customers = <Customer>[];
      json['customers'].forEach((element) => customers!.add(
            Customer.fromJson(element),
          ));
    }
    if (json['price_lists'] != null) {
      priceLists = <PriceList>[];
      json['price_lists'].forEach((element) => priceLists!.add(
            PriceList.fromJson(element),
          ));
    }
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'];
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
}
