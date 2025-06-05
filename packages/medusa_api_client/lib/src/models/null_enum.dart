// NullEnum
// {
//     "properties": {},
//     "type": "object",
//     "enum": [
//         "secret",
//         "publishable"
//     ]
// }

library;

import 'exports.dart';
part 'null_enum.g.dart';

@JsonEnum(alwaysCreate: true)
enum NullEnum {
  @JsonValue("secret")
  secret,
  @JsonValue("publishable")
  publishable;

  String toJson() => _$NullEnumEnumMap[this]!;
}
