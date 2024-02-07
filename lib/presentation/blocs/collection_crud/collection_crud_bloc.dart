import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/collection/collection_details_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'collection_crud_event.dart';
part 'collection_crud_state.dart';
part 'collection_crud_bloc.freezed.dart';

@injectable
class CollectionCrudBloc
    extends Bloc<CollectionCrudEvent, CollectionCrudState> {
  CollectionCrudBloc(this.collectionCrudUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_Delete>(_delete);
    on<_RemoveProducts>(_removeProducts);
    on<_AddProducts>(_addProducts);
  }
  Future<void> _load(
    _Load event,
    Emitter<CollectionCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await collectionCrudUseCase.getCollection(
      event.id,
      queryParameters: event.queryParameters,
    );
    result.when((collection) => emit(_Collection(collection)),
        (error) => emit(_Error(error)));
  }

  Future<void> _create(
    _Create event,
    Emitter<CollectionCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await collectionCrudUseCase.create(
      userCreateCollectionReq: event.userCreateCollectionReq,
    );
    result.when((collection) => emit(_Collection(collection)),
        (error) => emit(_Error(error)));
  }

  Future<void> _update(
    _Update event,
    Emitter<CollectionCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await collectionCrudUseCase.update(
      id: event.id,
      userCreateCollectionReq: event.userCreateCollectionReq,
    );
    result.when((collection) => emit(_Collection(collection)),
        (error) => emit(_Error(error)));
  }

  Future<void> _delete(
    _Delete event,
    Emitter<CollectionCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await collectionCrudUseCase.deleteCollection(event.id);
    result.when(
        (success) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  Future<void> _removeProducts(
    _RemoveProducts event,
    Emitter<CollectionCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await collectionCrudUseCase
        .removeProducts(event.userCollectionRemoveProductsReq);
    result.when(
        (success) => emit(_ProductsRemoved(success.removedProducts ?? [])),
        (error) => emit(_Error(error)));
  }

  Future<void> _addProducts(
    _AddProducts event,
    Emitter<CollectionCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await collectionCrudUseCase
        .updateProducts(event.userCollectionUpdateProductsReq);
    result.when((collection) => emit(_Collection(collection)),
        (error) => emit(_Error(error)));
  }

  final CollectionCrudUseCase collectionCrudUseCase;
  static CollectionCrudBloc get instance => getIt<CollectionCrudBloc>();
}
