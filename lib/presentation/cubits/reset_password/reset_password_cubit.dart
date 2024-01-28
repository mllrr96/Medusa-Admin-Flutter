import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/auth/reset_password_use_case.dart';

part 'reset_password_state.dart';
part 'reset_password_cubit.freezed.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordUseCase) : super(const _Initial());
  Future<void> resetPassword(String email) async {
    emit(const ResetPasswordState.loading());
    final result = await resetPasswordUseCase(email);
    result.when(
        (success) => emit(const _Success()), (error) => emit(_Error(error)));
  }

  final ResetPasswordUseCase resetPasswordUseCase;
}
