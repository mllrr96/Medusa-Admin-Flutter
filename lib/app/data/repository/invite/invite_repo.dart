import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_invite_req.dart';
import 'package:medusa_admin/app/data/models/res/invite.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../service/dio_service.dart';
import 'base_invite.dart';

class InviteRepo extends BaseInvite {
  final _dataProvider = DioService.instance.dio;

  /// Accepts an Invite and creates a corresponding user
  @override
  Future<Result<bool, Failure>> acceptInvitation({
    required UserAcceptInvitationReq userAcceptInvitationReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/invites/accept',
        data: userAcceptInvitationReq.toJson(),
      );
      if (response.statusCode == 200) {
        return const Success(true);
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Creates an Invite and triggers an 'invite' created event
  @override
  Future<Result<bool, Failure>> createInvitation({
    /// The email for the user to be created.
    required String email,

    /// The role of the user to be created.
    required UserRole role,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/invites',
        data: {
          'user': email,
          'role': role.value,
        },
      );
      if (response.statusCode == 200) {
        return const Success(true);
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Deletes an Invite
  @override
  Future<Result<UserDeleteInvitesRes, Failure>> deleteInvite({
    /// The ID of the Invite to delete.
    required String inviteId,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/invites/$inviteId',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteInvitesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Resends an Invite by triggering the 'invite' created event again
  @override
  Future<Result<bool, Failure>> resendInvite({
    /// The ID of the Invite to delete.
    required String inviteId,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/invites/$inviteId/resend',
      );
      if (response.statusCode == 200) {
        return const Success(true);
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Lists all Invites
  @override
  Future<Result<UserRetrieveInvitesRes, Failure>> retrieveInvites({
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/invites',
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveInvitesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
