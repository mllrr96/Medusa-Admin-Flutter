import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/publishable_api_keys.dart';
import 'package:medusa_admin/app/data/models/res/sales_channel_res.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class BasePublishableApiKey {
  Future<Result<UserRetrievePublishableApiKeysRes, Failure>> retrievePublishableApiKeys({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieve the Publishable Api Key.
  Future<Result<UserPublishableApiKeyRes, Failure>> retrievePublishableApiKey({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates a PublishableApiKey.
  Future<Result<UserPublishableApiKeyRes, Failure>> updatePublishableApiKey({
    /// The ID of the PublishableApiKey.
    required String id,

    /// A title to update for the key.
    String? title,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Creates a PublishableApiKey.
  Future<Result<UserPublishableApiKeyRes, Failure>> createPublishableApiKey({
    /// A title for the publishable api key.
    required String title,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Deletes a PublishableApiKeys
  Future<Result<UserPublishableApiKeyRes, Failure>> deletePublishableApiKey({
    /// The ID of the PublishableApiKeys to delete.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Revokes a PublishableApiKey.
  Future<Result<UserPublishableApiKeyRes, Failure>> revokePublishableApiKey({
    /// The ID of the PublishableApiKey.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// List PublishableApiKey's SalesChannels
  Future<Result<UserSalesChannelRetrieveAllRes, Failure>> retrieveSalesChannels({
    /// The ID of the Publishable Api Key.
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// List PublishableApiKey's SalesChannels
  Future<Result<UserPublishableApiKeyRes, Failure>> addSalesChannels({
    /// The ID of the Publishable Api Key.
    required String id,
    required List<String> salesChannelsIds,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// List PublishableApiKey's SalesChannels
  Future<Result<UserDeletePublishableApiKeyRes, Failure>> deleteSalesChannels({
    /// The ID of the Publishable Api Key.
    required String id,
    required List<String> salesChannelsIds,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
}
