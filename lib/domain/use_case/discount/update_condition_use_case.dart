import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateConditionUseCase {
  ProductsRepository get _productsRepository =>
      getIt<MedusaAdmin>().productsRepository;
  ProductTypeRepository get _typeRepository =>
      getIt<MedusaAdmin>().productTypeRepository;
  CollectionRepository get _collectionRepository =>
      getIt<MedusaAdmin>().collectionRepository;
  ProductTagRepository get _tagRepository =>
      getIt<MedusaAdmin>().productTagRepository;
  CustomerGroupRepository get _groupRepository =>
      getIt<MedusaAdmin>().customerGroupRepository;

  static UpdateConditionUseCase get instance => getIt<UpdateConditionUseCase>();

  Future<Result<ProductsListRes, Failure>> retrieveProducts(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _productsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<RetrieveProductTypesRes, Failure>> retrieveProductTypes(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _typeRepository.retrieveProductTypes(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<CollectionsRes, Failure>> retrieveCollections(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _collectionRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<RetrieveProductTagsRes, Failure>> retrieveProductTags(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _tagRepository.retrieveProductTags(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<RetrieveCustomerGroupsRes, Failure>> retrieveCustomerGroups(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _groupRepository.retrieveCustomerGroups(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
