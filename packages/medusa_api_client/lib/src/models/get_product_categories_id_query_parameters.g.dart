// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_categories_id_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetProductCategoriesIdQueryParameters
_$GetProductCategoriesIdQueryParametersFromJson(Map<String, dynamic> json) =>
    _GetProductCategoriesIdQueryParameters(
      fields: json['fields'] as String,
      includeAncestorsTree: json['include_ancestors_tree'] as bool,
      includeDescendantsTree: json['include_descendants_tree'] as bool,
    );

Map<String, dynamic> _$GetProductCategoriesIdQueryParametersToJson(
  _GetProductCategoriesIdQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'include_ancestors_tree': instance.includeAncestorsTree,
  'include_descendants_tree': instance.includeDescendantsTree,
};
