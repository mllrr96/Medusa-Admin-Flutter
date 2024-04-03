part of 'tags_cubit.dart';

@freezed
class TagsState with _$TagsState {
  const factory TagsState.initial() = _Initial;
  const factory TagsState.loading() = _Loading;
  const factory TagsState.tags(List<ProductTag> tags, int count) = _Tags;
  const factory TagsState.error(Failure failure) = _Error;
}
