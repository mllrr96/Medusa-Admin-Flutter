library;

import 'package:dio/dio.dart';
import 'models.dart';
import 'package:json_annotation/json_annotation.dart';

class AdminCreateProductVariantOrAdminUpdateProductVariantUnionMapJsonConverter
    implements
        JsonConverter<
          AdminCreateProductVariantOrAdminUpdateProductVariantUnion,
          Map<String, dynamic>
        > {
  const AdminCreateProductVariantOrAdminUpdateProductVariantUnionMapJsonConverter();

  static const String unionKey = r'value';

  @override
  AdminCreateProductVariantOrAdminUpdateProductVariantUnion fromJson(
    Map<String, dynamic> json,
  ) {
    return AdminCreateProductVariantOrAdminUpdateProductVariantUnion.fromJson({
      unionKey: json,
      ...json,
    });
  }

  @override
  Map<String, dynamic> toJson(
    AdminCreateProductVariantOrAdminUpdateProductVariantUnion object,
  ) {
    return {unionKey: object.toJson(), ...object.toJson()};
  }
}

class CreateAddressOrUpdateAddressUnionMapJsonConverter
    implements
        JsonConverter<CreateAddressOrUpdateAddressUnion, Map<String, dynamic>> {
  const CreateAddressOrUpdateAddressUnionMapJsonConverter();

  static const String unionKey = r'value';

  @override
  CreateAddressOrUpdateAddressUnion fromJson(Map<String, dynamic> json) {
    return CreateAddressOrUpdateAddressUnion.fromJson({
      unionKey: json,
      ...json,
    });
  }

  @override
  Map<String, dynamic> toJson(CreateAddressOrUpdateAddressUnion object) {
    return {unionKey: object.toJson(), ...object.toJson()};
  }
}

class AuthResponseOrAuthCallbackResponseUnionMapJsonConverter
    implements
        JsonConverter<
          AuthResponseOrAuthCallbackResponseUnion,
          Map<String, dynamic>
        > {
  const AuthResponseOrAuthCallbackResponseUnionMapJsonConverter();

  static const String unionKey = r'value';

  @override
  AuthResponseOrAuthCallbackResponseUnion fromJson(Map<String, dynamic> json) {
    return AuthResponseOrAuthCallbackResponseUnion.fromJson({
      unionKey: json,
      ...json,
    });
  }

  @override
  Map<String, dynamic> toJson(AuthResponseOrAuthCallbackResponseUnion object) {
    return {unionKey: object.toJson(), ...object.toJson()};
  }
}

class MultipartFileJsonConverter
    implements JsonConverter<MultipartFile, MultipartFile> {
  const MultipartFileJsonConverter();

  @override
  MultipartFile fromJson(MultipartFile json) => json;

  @override
  MultipartFile toJson(MultipartFile object) => object;
}

const jsonSerializableConverters = <JsonConverter>[
  MultipartFileJsonConverter(),
  AdminCreateProductVariantOrAdminUpdateProductVariantUnionMapJsonConverter(),
  CreateAddressOrUpdateAddressUnionMapJsonConverter(),
  AuthResponseOrAuthCallbackResponseUnionMapJsonConverter(),
];

const jsonSerializable = JsonSerializable(
  converters: jsonSerializableConverters,
);
