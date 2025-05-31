// ReferenceEnum
// {
//     "properties": {},
//     "type": "object",
//     "enum": [
//         "claim",
//         "exchange",
//         "return",
//         "order_shipping_method"
//     ]
// }

library reference_enum;

import 'exports.dart';
part 'reference_enum.g.dart';

@JsonEnum(alwaysCreate: true)
enum ReferenceEnum {
  @JsonValue("claim")
  claim,
  @JsonValue("exchange")
  exchange,
  @JsonValue("return")
  returnAA,
  @JsonValue("order_shipping_method")
  orderShippingMethod;

  String toJson() => _$ReferenceEnumEnumMap[this]!;
}
