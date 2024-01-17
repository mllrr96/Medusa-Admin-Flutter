import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class TagsUseCase {
  final ProductTagRepository _tagRepo =
      getIt<MedusaAdmin>().productTagRepository;
  static TagsUseCase get instance => getIt<TagsUseCase>();

  Future<Result<UserRetrieveProductTagsRes, Failure>> retrieveProductTags({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _tagRepo.retrieveProductTags(queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
