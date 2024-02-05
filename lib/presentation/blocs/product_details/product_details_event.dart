part of 'product_details_bloc.dart';

@freezed
class ProductDetailsEvent with _$ProductDetailsEvent {
  const factory ProductDetailsEvent.load(String id) = _Load;
  const factory ProductDetailsEvent.loadWithVariants(String id) = _LoadWithVariants;
  const factory ProductDetailsEvent.delete(String id) = _Delete;
  const factory ProductDetailsEvent.update(String id,UserPostUpdateProductReq userPostUpdateProductReq) = _Update;
}
