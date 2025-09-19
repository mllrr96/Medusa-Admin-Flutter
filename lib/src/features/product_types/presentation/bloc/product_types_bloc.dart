import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/product_types/domain/usecases/create_product_type_use_case.dart';
import 'package:medusa_admin/src/features/product_types/domain/usecases/delete_product_type_use_case.dart';
import 'package:medusa_admin/src/features/product_types/domain/usecases/list_product_types_use_case.dart';
import 'package:medusa_admin/src/features/product_types/domain/usecases/retrieve_product_type_use_case.dart';
import 'package:medusa_admin/src/features/product_types/domain/usecases/update_product_type_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'product_types_event.dart';

part 'product_types_state.dart';

part 'product_types_bloc.freezed.dart';

@injectable
class ProductTypesBloc extends Bloc<ProductTypesEvent, ProductTypesState> {
  ProductTypesBloc(
    this._listProductTypesUseCase,
    this._createProductTypeUseCase,
    this._deleteProductTypeUseCase,
    this._updateProductTypeUseCase,
    this._listProductTypeUseCase,
  ) : super(const _Initial()) {
    on<_LoadProductType>(_loadProductType);
    on<_LoadProductTypes>(_loadProductTypes);
    on<_CreateProductType>(_createProductType);
    on<_DeleteProductType>(_deleteProductType);
    on<_UpdateProductType>(_updateProductType);
  }

  final RetrieveProductTypeUseCase _listProductTypeUseCase;
  final ListProductTypesUseCase _listProductTypesUseCase;
  final CreateProductTypeUseCase _createProductTypeUseCase;
  final DeleteProductTypeUseCase _deleteProductTypeUseCase;
  final UpdateProductTypeUseCase _updateProductTypeUseCase;

  Future<void> _loadProductType(
    _LoadProductType event,
    Emitter<ProductTypesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listProductTypeUseCase(event.id);
    result.when(
      (productTypes) => emit(_ProductType(productTypes)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _loadProductTypes(
    _LoadProductTypes event,
    Emitter<ProductTypesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listProductTypesUseCase(queryParameters: event.queryParameters);
    result.when(
      (productTypes) => emit(_ProductTypes(productTypes)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _createProductType(
    _CreateProductType event,
    Emitter<ProductTypesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _createProductTypeUseCase(payload: event.payload);
    result.when(
      (productType) => emit(_ProductType(productType)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _deleteProductType(
    _DeleteProductType event,
    Emitter<ProductTypesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _deleteProductTypeUseCase(id: event.id);
    result.when(
      (deleted) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _updateProductType(
    _UpdateProductType event,
    Emitter<ProductTypesState> emit,
  ) async {
    emit(const _Loading());
    final result = await _updateProductTypeUseCase(id: event.id, payload: event.payload);
    result.when(
      (productType) => emit(_ProductType(productType)),
      (error) => emit(_Error(error)),
    );
  }

  static ProductTypesBloc get instance => getIt<ProductTypesBloc>();
  static const int pageSize = 20;

}
