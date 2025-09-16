import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateConditionUseCase {
  ProductsRepository get _productsRepository => _medusaAdminV2.products;
  ProductTypesRepository get _typeRepository => _medusaAdminV2.productTypes;
  CollectionsRepository get _collectionRepository => _medusaAdminV2.collections;
  ProductTagsRepository get _tagRepository => _medusaAdminV2.productTags;
  CustomerGroupsRepository get _groupRepository =>
      _medusaAdminV2.customerGroups;
  final MedusaAdminV2 _medusaAdminV2;

  UpdateConditionUseCase(this._medusaAdminV2);

  static UpdateConditionUseCase get instance => getIt<UpdateConditionUseCase>();

  Future<Result<ProductsRes, MedusaError>> retrieveProducts(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _productsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductTypeListResponse, MedusaError>> retrieveProductTypes(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _typeRepository.list(query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<CollectionListRes, MedusaError>> retrieveCollections(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _collectionRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductTagListResponse, MedusaError>> retrieveProductTags(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _tagRepository.list(query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<CustomerGroupsListRes, MedusaError>> retrieveCustomerGroups(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result =
          await _groupRepository.list(queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
