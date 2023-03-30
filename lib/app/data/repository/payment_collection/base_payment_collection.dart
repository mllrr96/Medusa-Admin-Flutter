import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/notification.dart';
import '../../models/res/payment_collection.dart';

abstract class BasePaymentCollection {
  Future<Result<UserRetrievePaymentCollectionRes, Failure>> retrievePaymentCollection({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeletePaymentCollectionRes, Failure>> deletePaymentCollection({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserRetrieveNotificationsRes, Failure>> updatePaymentCollection({
    required String id,

    String? description,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserRetrieveNotificationsRes, Failure>> markPaymentCollectionAuthorized({
    required String id,
    Map<String, dynamic>? customHeaders,
  });
}
