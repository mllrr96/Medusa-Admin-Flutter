import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/products/domain/usecases/product/product_crud_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'product_crud_event.dart';

part 'product_crud_state.dart';

part 'product_crud_bloc.freezed.dart';

@injectable
class ProductCrudBloc extends Bloc<ProductCrudEvent, ProductCrudState> {
  ProductCrudBloc(this.productCrudUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_LoadProductVariants>(_loadWithVariants);
    on<_Delete>(_delete);
    on<_Update>(_update);
    on<_Create>(_create);
  }

  Future<void> _load(
    _Load event,
    Emitter<ProductCrudState> emit,
  ) async {
    emit(ProductCrudLoading(id: event.id));
    final result = await productCrudUseCase.fetchProduct(
      event.id,
      // queryParameters: {
      // 'fields': 'images,options,variants,collection,tags,sales_channels,options.values'
      // },
    );
    result.when((product) {
      emit(ProductCrudProduct(product));
    }, (error) {
      emit(ProductCrudError(error));
    });
  }

  Future<void> _loadAll(
    _LoadAll event,
    Emitter<ProductCrudState> emit,
  ) async {
    emit(const ProductCrudLoading());
    final result = await productCrudUseCase.fetchProducts(
      queryParameters: {
        'limit': pageSize,
        ...?event.queryParameters,
      },
    );
    result.when((response) {
      emit(ProductCrudProducts(response.products, response.count));
    }, (error) {
      emit(ProductCrudError(error));
    });
  }

  Future<void> _loadWithVariants(
    _LoadProductVariants event,
    Emitter<ProductCrudState> emit,
  ) async {
    emit(ProductCrudLoading(id: event.id));
    final result = await productCrudUseCase.fetchVariants(
      event.id,
      // queryParameters: {
      //   'expand': 'options,prices',
      // },
    );
    result.when((result) {
      emit(ProductCrudProductVariants(result.variants));
    }, (error) {
      emit(ProductCrudError(error));
    });
  }

  Future<void> _create(
    _Create event,
    Emitter<ProductCrudState> emit,
  ) async {
    emit(const ProductCrudLoading());
    final result =
        await productCrudUseCase.createProduct(payload: event.payload);
    result.when((product) {
      emit(ProductCrudProduct(product));
    }, (error) {
      emit(ProductCrudError(error));
    });
  }

  Future<void> _delete(
    _Delete event,
    Emitter<ProductCrudState> emit,
  ) async {
    emit(ProductCrudLoading(id: event.id));
    final result = await productCrudUseCase.deleteProduct(id: event.id);
    result.when((success) {
      emit(const ProductCrudDeleted());
    }, (error) {
      emit(ProductCrudError(error));
    });
  }

  Future<void> _update(
    _Update event,
    Emitter<ProductCrudState> emit,
  ) async {
    emit(ProductCrudLoading(id: event.id));
    final result = await productCrudUseCase.updateProduct(
        id: event.id, payload: event.payload);
    result.when((success) {
      emit(ProductCrudUpdated(success));
    }, (error) {
      emit(ProductCrudError(error));
    });
  }

  final ProductCrudUseCase productCrudUseCase;

  static ProductCrudBloc get instance => getIt<ProductCrudBloc>();
  static const int pageSize = 20;
}
