import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/discount/discounts_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'update_discount_event.dart';
part 'update_discount_state.dart';
part 'update_discount_bloc.freezed.dart';

@injectable
class UpdateDiscountBloc
    extends Bloc<UpdateDiscountEvent, UpdateDiscountState> {
  UpdateDiscountBloc(this.discountsUseCase) : super(const _Initial()) {
    on<_UpdateDiscount>(_updateDiscount);
    on<_DeleteDiscount>(_deleteDiscount);
  }

  Future<void> _updateDiscount(
      _UpdateDiscount event, Emitter<UpdateDiscountState> emit) async {
    emit(_Loading(event.discountId));
    final result = await discountsUseCase.updateDiscount(
        id: event.discountId,
        userUpdateDiscountReq: event.updateDiscountReq);
    result.when(
        (discount) => emit(_Success(discount)), (error) => emit(_Error(error)));
  }

  Future<void> _deleteDiscount(
      _DeleteDiscount event, Emitter<UpdateDiscountState> emit) async {
    emit(_Loading(event.discountId));
    final result = await discountsUseCase.deleteDiscount(id: event.discountId);
    result.when((success) => emit(const _Success(null)),
        (error) => emit(_Error(error)));
  }

  final DiscountsUseCase discountsUseCase;
  static UpdateDiscountBloc get instance => getIt<UpdateDiscountBloc>();
}
