part of 'product_variants_cubit.dart';

@freezed
class ProductVariantsState with _$ProductVariantsState {
  const factory ProductVariantsState.initial() = _Initial;
  const factory ProductVariantsState.loading() = _Loading;
  const factory ProductVariantsState.variants(List<ProductVariant> variants, int count) = _Variants;
  const factory ProductVariantsState.error(Failure failure) = _Error;
}
