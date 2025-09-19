import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/product_tags/domain/usecases/create_product_tag_use_case.dart';
import 'package:medusa_admin/src/features/product_tags/domain/usecases/delete_product_tag_use_case.dart';
import 'package:medusa_admin/src/features/product_tags/domain/usecases/list_product_tags_use_case.dart';
import 'package:medusa_admin/src/features/product_tags/domain/usecases/retrieve_product_tag_use_case.dart';
import 'package:medusa_admin/src/features/product_tags/domain/usecases/update_product_tag_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'product_tags_event.dart';

part 'product_tags_state.dart';

part 'product_tags_bloc.freezed.dart';

@injectable
class ProductTagsBloc extends Bloc<ProductTagsEvent, ProductTagsState> {
  ProductTagsBloc(
    this._listProductTagsUseCase,
    this._createProductTagUseCase,
    this._deleteProductTagUseCase,
    this._updateProductTagUseCase,
    this._retrieveProductTagUseCase,
  ) : super(const _Initial()) {
    on<_LoadProductTag>(_loadProductTag);
    on<_LoadProductTags>(_loadProductTags);
    on<_CreateProductTag>(_createProductTag);
    on<_DeleteProductTag>(_deleteProductTag);
    on<_UpdateProductTag>(_updateProductTag);
    on<_RetrieveProductTag>(_retrieveProductTag);
  }

  final ListProductTagsUseCase _listProductTagsUseCase;
  final CreateProductTagUseCase _createProductTagUseCase;
  final DeleteProductTagUseCase _deleteProductTagUseCase;
  final UpdateProductTagUseCase _updateProductTagUseCase;
  final RetrieveProductTagUseCase _retrieveProductTagUseCase;

  Future<void> _loadProductTags(
    _LoadProductTags event,
    Emitter<ProductTagsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listProductTagsUseCase();
    result.when(
      (productTags) => emit(_ProductTags(productTags)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _loadProductTag(
    _LoadProductTag event,
    Emitter<ProductTagsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _retrieveProductTagUseCase(event.id);
    result.when(
      (productTags) => emit(_ProductTag(productTags)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _createProductTag(
    _CreateProductTag event,
    Emitter<ProductTagsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _createProductTagUseCase(payload: event.payload);
    result.when(
      (productTag) => emit(_ProductTag(productTag)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _deleteProductTag(
    _DeleteProductTag event,
    Emitter<ProductTagsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _deleteProductTagUseCase(id: event.id);
    result.when(
      (deleted) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _updateProductTag(
    _UpdateProductTag event,
    Emitter<ProductTagsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _updateProductTagUseCase(id: event.id, payload: event.payload);
    result.when(
      (productTag) => emit(_ProductTag(productTag)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _retrieveProductTag(
    _RetrieveProductTag event,
    Emitter<ProductTagsState> emit,
  ) async {
    emit(const _Loading());
    final result = await _retrieveProductTagUseCase(event.id);
    result.when(
      (productTag) => emit(_ProductTag(productTag)),
      (error) => emit(_Error(error)),
    );
  }

  static ProductTagsBloc get instance => getIt<ProductTagsBloc>();
  static const int pageSize = 20;
}
