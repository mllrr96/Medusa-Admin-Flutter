/// AdminApplicationMethod
/// {
///     "properties": {
///         "promotion": {
///             "type": "object"
///         },
///         "target_rules": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPromotionRule"
///             },
///             "description": "The application method's target rules."
///         },
///         "buy_rules": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPromotionRule"
///             },
///             "description": "The application method's buy rules."
///         },
///         "id": {
///             "type": "string",
///             "description": "The application method's ID.",
///             "title": "id"
///         },
///         "type": {
///             "enum": [
///                 "fixed",
///                 "percentage"
///             ],
///             "type": "string",
///             "description": "The application method's type. If it's `fixed`, the promotion discounts a fixed amount. If it's `percentage`, the promotion discounts a percentage."
///         },
///         "target_type": {
///             "enum": [
///                 "items",
///                 "shipping_methods",
///                 "order"
///             ],
///             "type": "string",
///             "description": "Which item does the promotion apply to. `items` mean the promotion applies to the cart's items; `shipping_methods` means the promotion applies to the cart's shipping methods; `order` means the promotion applies on the entire order."
///         },
///         "allocation": {
///             "enum": [
///                 "each",
///                 "across"
///             ],
///             "type": "string",
///             "description": "How is the promotion amount discounted. `each` means the discounted amount is applied on each applicable item; `across` means the discounted amount is split accross the applicable items."
///         },
///         "value": {
///             "type": "number",
///             "description": "The amount to be discounted.",
///             "title": "value"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The application method's currency code.",
///             "title": "currency_code"
///         },
///         "max_quantity": {
///             "type": "number",
///             "description": "The max quantity allowed in the cart for the associated promotion to be applied.",
///             "title": "max_quantity"
///         },
///         "buy_rules_min_quantity": {
///             "type": "number",
///             "description": "The minimum quantity required for a `buyget` promotion to be applied. For example, if the promotion is a \"Buy 2 shirts get 1 free\", the value of this attribute is `2`.",
///             "title": "buy_rules_min_quantity"
///         },
///         "apply_to_quantity": {
///             "type": "number",
///             "description": "The quantity that results from matching the `buyget` promotion's condition. For example, if the promotion is a \"Buy 2 shirts get 1 free\", the value of this attribute is `1`.",
///             "title": "apply_to_quantity"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id"
///     ],
///     "description": "The application method's details."
/// }
library admin_application_method;

import 'exports.dart';
part 'admin_application_method.freezed.dart';
part 'admin_application_method.g.dart'; // AdminApplicationMethod

@freezed
abstract class AdminApplicationMethod with _$AdminApplicationMethod {
  const AdminApplicationMethod._();

  @jsonSerializable
  const factory AdminApplicationMethod({
    /// promotion
    @JsonKey(name: AdminApplicationMethod.promotionKey)
    required Map<String, dynamic> promotion,

    /// targetRules
    @JsonKey(name: AdminApplicationMethod.targetRulesKey)
    required List<AdminPromotionRule> targetRules,

    /// buyRules
    @JsonKey(name: AdminApplicationMethod.buyRulesKey)
    required List<AdminPromotionRule> buyRules,

    /// id
    @JsonKey(name: AdminApplicationMethod.idKey) required String id,

    /// type
    @JsonKey(name: AdminApplicationMethod.typeKey) required NullEnum type,

    /// targetType
    @JsonKey(name: AdminApplicationMethod.targetTypeKey)
    required NullEnum targetType,

    /// allocation
    @JsonKey(name: AdminApplicationMethod.allocationKey)
    required NullEnum allocation,

    /// value
    @JsonKey(name: AdminApplicationMethod.valueKey) required double value,

    /// currencyCode
    @JsonKey(name: AdminApplicationMethod.currencyCodeKey)
    required String currencyCode,

    /// maxQuantity
    @JsonKey(name: AdminApplicationMethod.maxQuantityKey)
    required double maxQuantity,

    /// buyRulesMinQuantity
    @JsonKey(name: AdminApplicationMethod.buyRulesMinQuantityKey)
    required double buyRulesMinQuantity,

    /// applyToQuantity
    @JsonKey(name: AdminApplicationMethod.applyToQuantityKey)
    required double applyToQuantity,
  }) = _AdminApplicationMethod;

  factory AdminApplicationMethod.fromJson(Map<String, dynamic> json) =>
      _$AdminApplicationMethodFromJson(json);

  static const String promotionKey = r'promotion';

  static const String targetRulesKey = r'target_rules';

  static const String buyRulesKey = r'buy_rules';

  static const String idKey = r'id';

  static const String typeKey = r'type';

  static const String targetTypeKey = r'target_type';

  static const String allocationKey = r'allocation';

  static const String valueKey = r'value';

  static const String currencyCodeKey = r'currency_code';

  static const String maxQuantityKey = r'max_quantity';

  static const String buyRulesMinQuantityKey = r'buy_rules_min_quantity';

  static const String applyToQuantityKey = r'apply_to_quantity';
}
