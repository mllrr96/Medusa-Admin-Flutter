part of 'payment_providers_cubit.dart';

@freezed
class PaymentProvidersState with _$PaymentProvidersState {
  const factory PaymentProvidersState.initial() = _Initial;
  const factory PaymentProvidersState.loading() = _Loading;
  const factory PaymentProvidersState.paymentProviders(List<PaymentProvider> paymentProviders) = _PaymentProviders;
  const factory PaymentProvidersState.error(Failure failure) = _Error;
}
