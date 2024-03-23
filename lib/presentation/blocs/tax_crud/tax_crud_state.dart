part of 'tax_crud_bloc.dart';

@freezed
class TaxCrudState with _$TaxCrudState {
  const factory TaxCrudState.initial() = _Initial;
  const factory TaxCrudState.loading() = _Loading;
  const factory TaxCrudState.taxRate(TaxRate taxRate) = _TaxRate;
  const factory TaxCrudState.taxRates(List<TaxRate> taxRates, int count) = _TaxRates;
  const factory TaxCrudState.deleted() = _Deleted;
  const factory TaxCrudState.error(Failure failure) = _Error;
}
