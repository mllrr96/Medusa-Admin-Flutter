part of 'category_crud_bloc.dart';

@freezed
class CategoryCrudState with _$CategoryCrudState {
  const factory CategoryCrudState.initial() = _Initial;
  const factory CategoryCrudState.loading() = _Loading;
  const factory CategoryCrudState.category(ProductCategory category) =
      _Category;
  const factory CategoryCrudState.categories(
      List<ProductCategory> categories, int count) = _Categories;
  const factory CategoryCrudState.deleted() = _Deleted;
  const factory CategoryCrudState.error(Failure failure) = _Error;
}
