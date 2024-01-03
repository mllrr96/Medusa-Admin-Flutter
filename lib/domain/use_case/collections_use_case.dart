import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CollectionsUseCase {
  static CollectionsUseCase get instance => getIt<CollectionsUseCase>();
  final CollectionRepository _collectionsRepository =
      getIt<MedusaAdmin>().collectionRepository;

  Future<Result<UserCollectionsRes, Failure>> fetchCollections({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _collectionsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
