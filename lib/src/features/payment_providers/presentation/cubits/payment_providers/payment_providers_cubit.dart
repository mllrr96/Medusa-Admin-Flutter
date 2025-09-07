import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/payment_providers/domain/usecases/payment_provider/payment_provider_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

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
        emit(_PaymentProviders(paymentProviders.paymentProviders));
      },
      (error) {
        emit(_Error(error));
      },
    );
  }

  final PaymentProviderUseCase _useCase;
  static PaymentProvidersCubit instance = getIt<PaymentProvidersCubit>();
}
