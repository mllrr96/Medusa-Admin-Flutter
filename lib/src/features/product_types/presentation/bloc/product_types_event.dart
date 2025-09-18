part of 'product_types_bloc.dart';

@freezed
class ProductTypesEvent with _$ProductTypesEvent {
  const factory ProductTypesEvent.loadProductTypes(Map<String, dynamic>? queryParameters) =
      _LoadProductTypes;

  const factory ProductTypesEvent.loadProductType(String id) = _LoadProductType;

  const factory ProductTypesEvent.createProductType(CreateProductType payload) = _CreateProductType;

  const factory ProductTypesEvent.deleteProductType(String id) = _DeleteProductType;

  const factory ProductTypesEvent.updateProductType(String id, UpdateProductType payload) =
      _UpdateProductType;
}
