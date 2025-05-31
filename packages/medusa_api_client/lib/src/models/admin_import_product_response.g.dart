// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_import_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminImportProductResponse _$AdminImportProductResponseFromJson(
  Map<String, dynamic> json,
) => _AdminImportProductResponse(
  transactionId: json['transaction_id'] as String,
  summary: json['summary'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminImportProductResponseToJson(
  _AdminImportProductResponse instance,
) => <String, dynamic>{
  'transaction_id': instance.transactionId,
  'summary': instance.summary,
};
