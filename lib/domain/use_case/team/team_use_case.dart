import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class TeamUseCase {
  UserRepository get _userRepository => getIt<MedusaAdmin>().userRepository;
  InviteRepository get _inviteRepository =>
      getIt<MedusaAdmin>().inviteRepository;

  static TeamUseCase get instance => getIt<TeamUseCase>();

  Future<Result<UserRetrieveUserListRes, Failure>> fetchUsers() async {
    try {
      final result = await _userRepository.retrieveAll();
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserRetrieveInvitesRes, Failure>> fetchInvites() async {
    try {
      final result = await _inviteRepository.retrieveInvites();
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<bool, Failure>> inviteUser({
    required String email,
    required UserRole role,
  }) async {
    try {
      final result =
          await _inviteRepository.createInvitation(email: email, role: role);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<bool, Failure>> resendInvite(String inviteId) async {
    try {
      final result = await _inviteRepository.resendInvite(inviteId: inviteId);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserDeleteInvitesRes, Failure>> deleteInvite(String inviteId) async {
    try {
      final result = await _inviteRepository.deleteInvite(inviteId: inviteId);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<User, Failure>> updateUser({
    required String id,
    required UserUpdateUserReq userUpdateUserReq,
  }) async {
    try {
      final result = await _userRepository.update(
          id: id, userUpdateUserReq: userUpdateUserReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserDeleteUserRes, Failure>> deleteUser(
    String id,
  ) async {
    try {
      final result = await _userRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
