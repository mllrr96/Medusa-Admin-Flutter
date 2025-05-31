/// GetTaxRegionsIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         },
///         "province_code": {
///             "type": "string",
///             "description": "Filter by a tax region's province code.",
///             "title": "province_code"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "Filter by a tax provider ID to retrieve the tax regions using it.",
///             "title": "provider_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "Filter by a tax region's metadata. Refer to the [Object Query Parameter](https://docs.medusajs.com/api/admin#object) section to learn how to filter by object fields."
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_tax_regions_id_query_parameters.freezed.dart';
part 'get_tax_regions_id_query_parameters.g.dart'; // GetTaxRegionsIdQueryParameters

@freezed
abstract class GetTaxRegionsIdQueryParameters
    with _$GetTaxRegionsIdQueryParameters {
  const GetTaxRegionsIdQueryParameters._();

  @jsonSerializable
  const factory GetTaxRegionsIdQueryParameters({
    /// fields
    @JsonKey(name: GetTaxRegionsIdQueryParameters.fieldsKey)
    required String fields,

    /// provinceCode
    @JsonKey(name: GetTaxRegionsIdQueryParameters.provinceCodeKey)
    required String provinceCode,

    /// providerId
    @JsonKey(name: GetTaxRegionsIdQueryParameters.providerIdKey)
    required String providerId,

    /// metadata
    @JsonKey(name: GetTaxRegionsIdQueryParameters.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _GetTaxRegionsIdQueryParameters;

  factory GetTaxRegionsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetTaxRegionsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String provinceCodeKey = r'province_code';

  static const String providerIdKey = r'provider_id';

  static const String metadataKey = r'metadata';
}
