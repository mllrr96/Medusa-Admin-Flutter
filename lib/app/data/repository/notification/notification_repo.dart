import 'dart:developer';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/notification.dart';
import 'package:multiple_result/multiple_result.dart';
import 'base_notification.dart';
import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class NotificationRepo extends BaseNotification {
  final _dataProvider = DioClient(dio: Dio());

  /// Resends a previously sent notifications, with the same data but optionally to a different address
  @override
  Future<Result<UserNotificationsRes, Failure>> resendNotifications({
    /// The ID of the Notification
    required String id,

    /// A new address or user identifier that the Notification should be sent to
    required String to,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/notifications/$id/resend',
      );
      if (response.statusCode == 200) {
        return Success(UserNotificationsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of Notifications.
  @override
  Future<Result<UserRetrieveNotificationsRes, Failure>> retrieveNotifications({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/notifications',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveNotificationsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
