import 'index.dart';

class PriceList {
  String? id;
  String? name;
  String? description;
  PriceListType type = PriceListType.sale;
  PriceListStatus status = PriceListStatus.draft;
  DateTime? startsAt;
  DateTime? endsAt;
  List<CustomerGroup>? customerGroups;

  // TODO: implement prices, object ref - #https://docs.medusajs.com/api/store/#tag/Auth/operation/PostAuth
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  PriceList({
    this.id,
    this.name,
    this.description,
    this.type = PriceListType.sale,
    this.status = PriceListStatus.draft,
    this.startsAt,
    this.endsAt,
    this.customerGroups,
  });

  PriceList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = PriceListType.values.firstWhere((element) => json['type'] ?? '',
        orElse: () => PriceListType.sale);
    status = PriceListStatus.values.firstWhere(
        (element) => json['status'] ?? '',
        orElse: () => PriceListStatus.draft);
    startsAt = DateTime.tryParse(json['starts_at'] ?? '');
    endsAt = DateTime.tryParse(json['ends_at'] ?? '');
    if (json['customer_groups'] != null) {
      customerGroups = <CustomerGroup>[];
      customerGroups = json['customer_groups']
          .forEach((e) => customerGroups!.add(CustomerGroup.fromJson(e)));
    }
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
  }

//TODO: implement priceList to json
}

enum PriceListType {
  sale,
  override,
}

enum PriceListStatus {
  active,
  draft,
}
