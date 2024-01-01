import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class UpdateConditionUseCase {
  final ProductsRepository _productsRepository =
      getIt<MedusaAdmin>().productsRepository;
  final ProductTypeRepository _typeRepository =
      getIt<MedusaAdmin>().productTypeRepository;
  final CollectionRepository _collectionRepository =
      getIt<MedusaAdmin>().collectionRepository;
  final ProductTagRepository _tagRepository =
      getIt<MedusaAdmin>().productTagRepository;
  final CustomerGroupRepository _groupRepository =
      getIt<MedusaAdmin>().customerGroupRepository;

  static UpdateConditionUseCase get instance => getIt<UpdateConditionUseCase>();

  Future<Result<UserProductsListRes, Failure>> retrieveProducts(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _productsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserRetrieveProductTypesRes, Failure>> retrieveProductTypes(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _typeRepository.retrieveProductTypes(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserCollectionsRes, Failure>> retrieveCollections(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _collectionRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserRetrieveProductTagsRes, Failure>> retrieveProductTags(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _tagRepository.retrieveProductTags(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserRetrieveCustomerGroupsRes, Failure>> retrieveCustomerGroups(
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
