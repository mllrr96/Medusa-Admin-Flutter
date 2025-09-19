part of 'product_tags_bloc.dart';

@freezed
class ProductTagsEvent with _$ProductTagsEvent {
  const factory ProductTagsEvent.loadProductTag(String id) = _LoadProductTag;
  const factory ProductTagsEvent.loadProductTags(Map<String, dynamic>? query) = _LoadProductTags;
  const factory ProductTagsEvent.createProductTag(CreateProductTag payload) = _CreateProductTag;
  const factory ProductTagsEvent.deleteProductTag(String id) = _DeleteProductTag;
  const factory ProductTagsEvent.updateProductTag(String id, UpdateProductTag payload) = _UpdateProductTag;
  const factory ProductTagsEvent.retrieveProductTag(String id) = _RetrieveProductTag;
}
