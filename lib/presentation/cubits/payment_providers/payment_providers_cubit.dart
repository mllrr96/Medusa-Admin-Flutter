import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/payment_provider/payment_provider_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'payment_providers_state.dart';
part 'payment_providers_cubit.freezed.dart';

@injectable
class PaymentProvidersCubit extends Cubit<PaymentProvidersState> {
  PaymentProvidersCubit(PaymentProviderUseCase paymentProviderUseCase)
      : _useCase = paymentProviderUseCase,
        super(const _Initial());

  Future<void> fetchPaymentProviders() async {
    emit(const _Loading());
    final result = await _useCase();
    result.when(
      (paymentProviders) {
        emit(_PaymentProviders(paymentProviders));
      },
      (error) {
        emit(_Error(error));
      },
    );
  }

  final PaymentProviderUseCase _useCase;
  static PaymentProvidersCubit instance = getIt<PaymentProvidersCubit>();
}
