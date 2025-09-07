import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class NotificationUseCase {
  final MedusaAdminV2 _medusaAdmin;

  NotificationUseCase(this._medusaAdmin);

  NotificationsRepository get _notificationRepository => _medusaAdmin.notifications;

  static NotificationUseCase get instance => getIt<NotificationUseCase>();

  // Future<Result<Notification, MedusaError>> resend(String id, String? to) async {
  //   try {
  //     final result = await _notificationRepository.resendNotifications(id: id, to: to ?? '');
  //     return Success(result!);
  //   } on DioException catch (e) {
  //     return Error(MedusaError.fromHttp(
  //       status: e.response?.statusCode,
  //       body: e.response?.data,
  //       cause: e,
  //     ));
  //   } catch (error, stack) {
  //     if (kDebugMode) {
  //       log(error.toString());
  //       log(stack.toString());
  //     }
  //     return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
  //   }
  // }

  Future<Result<NotificationsListRes, MedusaError>> loadAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _notificationRepository.list(query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
