part of 'product_tags_bloc.dart';

@freezed
class ProductTagsState with _$ProductTagsState {
  const factory ProductTagsState.initial() = _Initial;
  const factory ProductTagsState.loading() = _Loading;
  const factory ProductTagsState.productTags(ProductTagListResponse productTags) = _ProductTags;
  const factory ProductTagsState.productTag(ProductTagResponse productTag) = _ProductTag;
  const factory ProductTagsState.deleted() = _Deleted;
  const factory ProductTagsState.error(MedusaError failure) = _Error;
}