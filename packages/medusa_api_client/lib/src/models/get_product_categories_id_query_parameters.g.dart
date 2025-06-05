// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_categories_id_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProductCategoriesIdQueryParametersImpl
_$$GetProductCategoriesIdQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetProductCategoriesIdQueryParametersImpl(
  fields: json['fields'] as String,
  includeAncestorsTree: json['include_ancestors_tree'] as bool,
  includeDescendantsTree: json['include_descendants_tree'] as bool,
);

Map<String, dynamic> _$$GetProductCategoriesIdQueryParametersImplToJson(
  _$GetProductCategoriesIdQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'include_ancestors_tree': instance.includeAncestorsTree,
  'include_descendants_tree': instance.includeDescendantsTree,
};
