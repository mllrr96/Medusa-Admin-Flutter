part of 'tax_provider_cubit.dart';

@freezed
class TaxProviderState with _$TaxProviderState {
  const factory TaxProviderState.initial() = _Initial;
  const factory TaxProviderState.loading() = _Loading;
  const factory TaxProviderState.taxProviders(List<TaxProvider> taxProviders) = _Loaded;
  const factory TaxProviderState.error(Failure failure) = _Error;
}
