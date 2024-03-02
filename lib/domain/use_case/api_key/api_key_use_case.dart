import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ApiKeyUseCase {
  PublishableApiKeyRepository get _apiKeyRepository =>
      getIt<MedusaAdmin>().publishableApiKeyRepository;

  static ApiKeyUseCase get instance => getIt<ApiKeyUseCase>();

  Future<Result<PublishableApiKey, Failure>> create(String title) async {
    try {
      final result =
          await _apiKeyRepository.createPublishableApiKey(title: title);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<PublishableApiKey, Failure>> update(
      String id, String title) async {
    try {
      final result =
          await _apiKeyRepository.updatePublishableApiKey(title: title, id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<UserDeletePublishableApiKeyRes, Failure>> delete(String id) async {
    try {
      final result =
          await _apiKeyRepository.deletePublishableApiKey( id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<PublishableApiKey, Failure>> load(String id) async {
    try {
      final result = await _apiKeyRepository.retrievePublishableApiKey(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<PublishableApiKey, Failure>> revoke(String id) async {
    try {
      final result = await _apiKeyRepository.revokePublishableApiKey(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserRetrievePublishableApiKeysRes, Failure>> loadAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _apiKeyRepository.retrievePublishableApiKeys(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserSalesChannelRetrieveAllRes, Failure>> loadAllSalesChannels(
      String id,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _apiKeyRepository.retrieveSalesChannels(
          id: id, queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<PublishableApiKey, Failure>> addSalesChannels(
      String id, List<String> salesChannelsIds,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _apiKeyRepository.addSalesChannels(
          id: id,
          queryParameters: queryParameters,
          salesChannelsIds: salesChannelsIds);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<PublishableApiKey, Failure>> removeSalesChannels(
      String id, List<String> salesChannelsIds,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _apiKeyRepository.deleteSalesChannels(
          id: id,
          queryParameters: queryParameters,
          salesChannelsIds: salesChannelsIds);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
