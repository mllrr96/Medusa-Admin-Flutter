// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_capture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseCaptureImpl _$$BaseCaptureImplFromJson(Map<String, dynamic> json) =>
    _$BaseCaptureImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      createdBy: json['created_by'] as String,
      payment: json['payment'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$BaseCaptureImplToJson(_$BaseCaptureImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by': instance.createdBy,
      'payment': instance.payment,
    };
