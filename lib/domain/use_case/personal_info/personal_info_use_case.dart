import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PersonalInfoUseCase {
  UserRepository get _userRepository => getIt<MedusaAdmin>().userRepository;
  AuthRepository get _authRepository => getIt<MedusaAdmin>().authRepository;

  static PersonalInfoUseCase get instance => getIt<PersonalInfoUseCase>();

  Future<Result<User, Failure>> currentUser() async {
    try {
      final result = await _authRepository.getCurrentUser();
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<User, Failure>> fetchUser(String id) async {
    try {
      final result = await _userRepository.retrieve(id: id);
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
}
