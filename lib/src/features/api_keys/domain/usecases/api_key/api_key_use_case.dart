import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ApiKeyUseCase {
  ApiKeyUseCase(this._medusaAdminV2);

  ApiKeysRepository get _apiKeyRepository => _medusaAdminV2.apiKeys;

  final MedusaAdminV2 _medusaAdminV2;

  static ApiKeyUseCase get instance => getIt<ApiKeyUseCase>();

  Future<Result<ApiKey, MedusaError>> create(String title, ApiKeyType type) async {
    try {
      final result = await _apiKeyRepository
          .create(CreateApiKeyReq(title: title, type: type));
      return Success(result.apiKey);
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

  Future<Result<ApiKey, MedusaError>> update(String id, String title) async {
    try {
      final result =
          await _apiKeyRepository.update(id, UpdateApiKeyReq(title: title));
      return Success(result.apiKey);
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

  Future<Result<Unit, MedusaError>> delete(String id) async {
    try {
      await _apiKeyRepository.delete(id);
      return Success(unit);
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

  Future<Result<ApiKey, MedusaError>> load(String id) async {
    try {
      final result = await _apiKeyRepository.retrieve(id);
      return Success(result.apiKey);
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

  Future<Result<ApiKey, MedusaError>> revoke(String id) async {
    try {
      final result = await _apiKeyRepository.revoke(id);
      return Success(result.apiKey);
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

  Future<Result<ApiKeysListRes, MedusaError>> loadAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result =
          await _apiKeyRepository.list(queryParameters: queryParameters);
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

  // Future<Result<Unit, MedusaError>> loadAllSalesChannels(String id,
  //     {Map<String, dynamic>? queryParameters}) async {
  //   try {
  //     final result = await _apiKeyRepository.salesChannels(id, queryParameters ?? {});
  //     return Success(unit);
  //   } on DioException catch (e) {
  //     return Error(MedusaError.fromHttp(
  //       status: e.response?.statusCode,
  //       body: e.response?.data,
  //       cause: e,
  //     ));
  //   } catch (error) {
  //     return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
  //   }
  // }

  Future<Result<ApiKey, MedusaError>> addSalesChannels(
      String id, List<String> salesChannelsIds,
      {Map<String, dynamic>? queryParameters}) async {
    throw UnimplementedError();
    // try {
    //   final result = await _apiKeyRepository.addSalesChannels(
    //       id: id, queryParameters: queryParameters, salesChannelsIds: salesChannelsIds);
    //   return Success(result!);
    // } catch (error) {
    //   return Error(Failure.from(error));
    // }
  }

  Future<Result<ApiKey, MedusaError>> removeSalesChannels(
      String id, List<String> salesChannelsIds,
      {Map<String, dynamic>? queryParameters}) async {
    throw UnimplementedError();
    // try {
    //   final result = await _apiKeyRepository.deleteSalesChannels(
    //       id: id, queryParameters: queryParameters, salesChannelsIds: salesChannelsIds);
    //   return Success(result!);
    // } catch (error) {
    //   return Error(Failure.from(error));
    // }
  }
}
