// PromotionTypeEnum
// {
//     "properties": {},
//     "type": "object",
//     "enum": [
//         "standard",
//         "buyget"
//     ]
// }

library promotion_type_enum;

import 'exports.dart';
part 'promotion_type_enum.g.dart';

@JsonEnum(alwaysCreate: true)
enum PromotionTypeEnum {
  @JsonValue("standard")
  standard,
  @JsonValue("buyget")
  buyget;

  String toJson() => _$PromotionTypeEnumEnumMap[this]!;
}
