import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ProductsFilterUseCase {
  static ProductsFilterUseCase get instance => getIt<ProductsFilterUseCase>();
  CollectionRepository get _collectionRepository =>
      getIt<MedusaAdmin>().collectionRepository;
  ProductTagRepository get _productTagRepository =>
      getIt<MedusaAdmin>().productTagRepository;

  Future<Result<(UserCollectionsRes, UserRetrieveProductTagsRes), Failure>>
  call() async {
    try {
      final collections = await _collectionRepository.retrieveAll();
      final tags = await _productTagRepository.retrieveProductTags();
      return Success((collections!, tags!));
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
