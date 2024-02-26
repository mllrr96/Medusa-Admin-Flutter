import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/discount/discount_details_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'discount_details_state.dart';
part 'discount_details_cubit.freezed.dart';

@injectable
class DiscountDetailsCubit extends Cubit<DiscountDetailsState> {
  DiscountDetailsCubit(this.discountDetailsUseCase) : super(const _Initial());
  Future<void> loadDiscount(String discountId) async {
    emit(const DiscountDetailsState.loading());
    final result = await discountDetailsUseCase
        .retrieveDiscount(id: discountId, queryParameters: {
      'expand': 'regions,regions.currency,rule,rule.conditions',
    });
    result.when((discount) {
      emit(DiscountDetailsState.discount(discount));
    }, (error) {
      emit(DiscountDetailsState.error(error));
    });
  }

  final DiscountCrudUseCase discountDetailsUseCase;
  static DiscountDetailsCubit get instance => getIt<DiscountDetailsCubit>();
}
