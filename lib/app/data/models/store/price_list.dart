import 'package:equatable/equatable.dart';
import 'index.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';

part 'price_list.g.dart';

@CopyWith()
class PriceList extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final PriceListType type;
  final PriceListStatus status;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final List<CustomerGroup>? customerGroups;
  final List<MoneyAmount>? prices;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const PriceList({
    this.id,
    this.name,
    this.prices,
    this.description,
    required this.type,
    required this.status,
    this.startsAt,
    this.endsAt,
    this.customerGroups,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory PriceList.fromJson(Map<String, dynamic> json) {
    return PriceList(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      prices: (json['prices'] as List<dynamic>?)?.map((e) => MoneyAmount.fromJson(e)).toList(),
      customerGroups: (json['customer_groups'] as List<dynamic>?)?.map((e) => CustomerGroup.fromJson(e)).toList(),
      type:
          PriceListType.values.firstWhere((element) => element.value == json['type'], orElse: () => PriceListType.sale),
      status: PriceListStatus.values
          .firstWhere((element) => element.value == json['status'], orElse: () => PriceListStatus.draft),
      startsAt: DateTime.tryParse(json['starts_at'] ?? ''),
      endsAt: DateTime.tryParse(json['ends_at'] ?? ''),
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

//TODO: implement priceList to json
}

enum PriceListType {
  sale('sale'),
  override('override');

  final String value;

  const PriceListType(this.value);
}

enum PriceListStatus {
  active('active'),
  draft('draft');

  final String value;

  const PriceListStatus(this.value);
}
