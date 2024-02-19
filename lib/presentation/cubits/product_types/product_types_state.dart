part of 'product_types_cubit.dart';

@freezed
class ProductTypesState with _$ProductTypesState {
  const factory ProductTypesState.initial() = _Initial;
  const factory ProductTypesState.loading() = _Loading;
  const factory ProductTypesState.types(List<ProductType> types, int count) = _Types;
  const factory ProductTypesState.error(Failure failure) = _Error;
}
