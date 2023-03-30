import 'package:medusa_admin/core/utils/enums.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_invite_req.dart';
import '../../models/res/invite.dart';

abstract class BaseInvite {
  Future<Result<bool, Failure>> acceptInvitation({
    required UserAcceptInvitationReq userAcceptInvitationReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<bool, Failure>> createInvitation({
    required String email,
    required UserRole role,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserRetrieveInvitesRes, Failure>> retrieveInvites({
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteInvitesRes, Failure>> deleteInvite({
    required String inviteId,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<bool, Failure>> resendInvite({
    required String inviteId,
    Map<String, dynamic>? customHeaders,
  });
}
