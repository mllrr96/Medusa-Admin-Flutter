import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/category/category_crud_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'category_crud_event.dart';
part 'category_crud_state.dart';
part 'category_crud_bloc.freezed.dart';

@injectable
class CategoryCrudBloc extends Bloc<CategoryCrudEvent, CategoryCrudState> {
  CategoryCrudBloc(CategoryCrudUseCase categoryCrudUseCase)
      : _useCase = categoryCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_Delete>(_delete);
    on<_AddProducts>(_addProducts);
    on<_RemoveProducts>(_removeProducts);
  }

  Future<void> _load(_Load event, Emitter<CategoryCrudState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.load(event.id, queryParameters: event.queryParameters);
    result.when(
      (success) {
        emit(_Category(success));
      },
      (error) {
        emit(CategoryCrudState.error(error));
      },
    );
  }

  Future<void> _loadAll(_LoadAll event, Emitter<CategoryCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.loadAll(queryParameters: {
      'limit': pageSize,
      ...?event.queryParameters,
    });
    result.when(
      (success) {
        emit(_Categories(success.productCategories ?? [], success.count ?? 0));
      },
      (error) {
        emit(CategoryCrudState.error(error));
      },
    );
  }

  Future<void> _create(_Create event, Emitter<CategoryCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.create(event.userCreateProductCategoryReq);
    result.when(
      (success) {
        emit(_Category(success));
      },
      (error) {
        emit(CategoryCrudState.error(error));
      },
    );
  }

  Future<void> _update(_Update event, Emitter<CategoryCrudState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.update(event.id, event.userUpdateProductCategoryReq);
    result.when(
      (success) {
        emit(_Category(success));
      },
      (error) {
        emit(CategoryCrudState.error(error));
      },
    );
  }

  Future<void> _delete(_Delete event, Emitter<CategoryCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.delete(event.id);
    result.when(
      (success) {
        emit(const _Deleted());
      },
      (error) {
        emit(CategoryCrudState.error(error));
      },
    );
  }

  Future<void> _addProducts(
      _AddProducts event, Emitter<CategoryCrudState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.addProductsToCategory(event.id, event.productIds);
    result.when(
      (success) {
        emit(_Category(success));
      },
      (error) {
        emit(CategoryCrudState.error(error));
      },
    );
  }

  Future<void> _removeProducts(
      _RemoveProducts event, Emitter<CategoryCrudState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.removeProductsToCategory(event.id, event.productIds);
    result.when(
      (success) {
        emit(_Category(success));
      },
      (error) {
        emit(CategoryCrudState.error(error));
      },
    );
  }

  final CategoryCrudUseCase _useCase;
  static int pageSize = 20;
  static CategoryCrudBloc get instance => getIt<CategoryCrudBloc>();
}
