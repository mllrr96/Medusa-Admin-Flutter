import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PersonalInfoCrudUseCase {
  UserRepository get _userRepository => getIt<MedusaAdmin>().userRepository;
  AuthRepository get _authRepository => getIt<MedusaAdmin>().authRepository;

  static PersonalInfoCrudUseCase get instance =>
      getIt<PersonalInfoCrudUseCase>();

  Future<Result<User, MedusaError>> currentUser() async {
    try {
      final result = await _authRepository.getCurrentUser();
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<User, MedusaError>> fetchUser(String id) async {
    try {
      final result = await _userRepository.retrieve(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<RetrieveUserListRes, MedusaError>> fetchUsers(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result =
          await _userRepository.retrieveAll(queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<User, MedusaError>> updateUser({
    required String id,
    required UpdateUserReq payload,
  }) async {
    try {
      final result = await _userRepository.update(
          id: id, userUpdateUserReq: payload);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<User, MedusaError>> createUser({
    required CreateUserReq payload,
  }) async {
    try {
      final result =
          await _userRepository.create(userCreateUserReq: payload);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<User, MedusaError>> resetPassword({
    required ResetPasswordReq payload,
  }) async {
    try {
      final result = await _userRepository.resetPassword(
          userResetPasswordReq: payload);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<DeleteUserRes, MedusaError>> delete(String id) async {
    try {
      final result = await _userRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<bool, MedusaError>> requestPasswordReset(
      {required String email}) async {
    try {
      final result = await _userRepository.requestPasswordReset(email: email);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
