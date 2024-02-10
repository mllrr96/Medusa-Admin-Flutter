import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/extension/copy_with_product.dart';
import 'package:medusa_admin/domain/use_case/product/product_details_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

@injectable
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(this.productDetailsUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadWithVariants>(_loadWithVariants);
    on<_Delete>(_delete);
    on<_Update>(_update);
  }

  Future<void> _load(
    _Load event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const _Loading());
    final result = await productDetailsUseCase.fetchProduct(
      event.id,
      queryParameters: {
        'expand':
            'images,options,variants,collection,tags,sales_channels,options.values'
      },
    );
    result.when((product) {
      emit(_Product(product));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _loadWithVariants(
    _LoadWithVariants event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const _Loading());
    final result = await productDetailsUseCase.fetchProduct(
      event.id,
      queryParameters: {
        'expand':
            'images,options,variants,collection,tags,sales_channels,options.values'
      },
    );
    await result.when((product) async {
      if (product.variants?.isEmpty ?? true) {
        emit(_Product(product));
        return;
      }

      List<ProductVariant> variants = [];
      for (ProductVariant variant in product.variants!) {
        final result = await productDetailsUseCase.fetchVariants(
            queryParameters: {'id': variant.id!, 'expand': 'options,prices'});
        result.when((v) {
          variants.addAll(v);
        }, (error) {});
      }
      emit(_Product(product.copyWith(variants: variants)));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _delete(
    _Delete event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const _Loading());
    final result = await productDetailsUseCase.deleteProduct(id: event.id);
    result.when((success) {
      emit(const _Deleted());
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _update(
    _Update event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const _Loading());
    final result = await productDetailsUseCase.updateProduct(
        id: event.id, userPostUpdateProductReq: event.userPostUpdateProductReq);
    result.when((success) {
      emit(_Updated(success));
    }, (error) {
      emit(_Error(error));
    });
  }

  final ProductDetailsUseCase productDetailsUseCase;
  static ProductDetailsBloc instance = getIt<ProductDetailsBloc>();
}
