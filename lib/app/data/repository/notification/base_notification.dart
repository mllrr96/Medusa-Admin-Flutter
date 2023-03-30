import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/notification.dart';

abstract class BaseNotification {

  Future<Result<UserRetrieveNotificationsRes, Failure>> retrieveNotifications({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
  Future<Result<UserNotificationsRes, Failure>> resendNotifications({
    required String id,
    required String to,
    Map<String, dynamic>? customHeaders,
  });
}