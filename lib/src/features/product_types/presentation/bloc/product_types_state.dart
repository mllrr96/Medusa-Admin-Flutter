part of 'product_types_bloc.dart';

@freezed
class ProductTypesState with _$ProductTypesState {
  const factory ProductTypesState.initial() = _Initial;
  const factory ProductTypesState.loading() = _Loading;
  const factory ProductTypesState.productTypes(ProductTypeListResponse productTypesRes) = _ProductTypes;
  const factory ProductTypesState.productType(ProductTypeResponse productType) = _ProductType;
  const factory ProductTypesState.deleted() = _Deleted;
  const factory ProductTypesState.error(MedusaError failure) = _Error;
}