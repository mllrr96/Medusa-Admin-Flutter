// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_price_list_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPriceListBatchResponse _$AdminPriceListBatchResponseFromJson(
  Map<String, dynamic> json,
) => _AdminPriceListBatchResponse(
  created: (json['created'] as List<dynamic>)
      .map((e) => AdminPrice.fromJson(e as Map<String, dynamic>))
      .toList(),
  updated: (json['updated'] as List<dynamic>)
      .map((e) => AdminPrice.fromJson(e as Map<String, dynamic>))
      .toList(),
  deleted: json['deleted'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminPriceListBatchResponseToJson(
  _AdminPriceListBatchResponse instance,
) => <String, dynamic>{
  'created': instance.created,
  'updated': instance.updated,
  'deleted': instance.deleted,
};
