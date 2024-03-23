part of 'currencies_cubit.dart';

@freezed
class CurrenciesState with _$CurrenciesState {
  const factory CurrenciesState.initial() = _Initial;
  const factory CurrenciesState.loading() = _Loading;
  const factory CurrenciesState.currencies(
      List<Currency> currencies, int count) = _Currencies;
  const factory CurrenciesState.error(Failure failure) = _Error;
}
