// ApplicationMethodTypeEnum
// {
//     "properties": {},
//     "type": "object",
//     "enum": [
//         "fixed",
//         "percentage"
//     ]
// }

library;

import 'exports.dart';
part 'application_method_type_enum.g.dart';

@JsonEnum(alwaysCreate: true)
enum ApplicationMethodTypeEnum {
  @JsonValue("fixed")
  fixed,
  @JsonValue("percentage")
  percentage;

  String toJson() => _$ApplicationMethodTypeEnumEnumMap[this]!;
}
