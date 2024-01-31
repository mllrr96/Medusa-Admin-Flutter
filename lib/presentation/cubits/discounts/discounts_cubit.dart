import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/discount/discounts_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'discounts_state.dart';
part 'discounts_cubit.freezed.dart';

@injectable
class DiscountsCubit extends Cubit<DiscountsState> {
  DiscountsCubit(this.discountsUseCase) : super(const _Initial());
  Future<void> loadDiscounts({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await discountsUseCase.retrieveDiscounts(
        queryParameters: {
      'limit': pageSize,
      'is_dynamic': false,
    }..addAll(queryParameters ?? {}));
    result.when((success) {
      emit(_Discounts(success.discounts!, success.count ?? 0));
    }, (error) {
      emit(_Error(error));
    });
  }

  static int pageSize = 20;
  final DiscountsUseCase discountsUseCase;
  static DiscountsCubit get instance => getIt<DiscountsCubit>();
}
