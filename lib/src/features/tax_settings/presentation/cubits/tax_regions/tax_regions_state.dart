part of 'tax_regions_cubit.dart';

@freezed
class TaxRegionsState with _$TaxRegionsState{
  const factory TaxRegionsState.initial() = _Initial;
  const factory TaxRegionsState.loading() = _Loading;
  const factory TaxRegionsState.taxRegions(List<TaxRegion> taxProviders) =
      _Loaded;
  const factory TaxRegionsState.error(MedusaError failure) = _Error;
}
