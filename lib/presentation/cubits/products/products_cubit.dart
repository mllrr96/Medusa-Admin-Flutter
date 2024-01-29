import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/product/products_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'products_state.dart';
part 'products_cubit.freezed.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsUseCase) : super(const _Initial());
  Future<void> loadProducts({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    int offset = state.mapOrNull(products: (_) => _.products.length) ?? 0;

    final result = await productsUseCase.fetchProducts(
        queryParameters: {
      'offset': offset,
      'limit': pageSize,
      // 'order': sortOptions.map(),
      'is_giftcard': 'false',
    }..addAll(queryParameters ?? {}));
    result.when((response) {
      emit(_Products(response.products!, response.count ?? 0));
    }, (error) {
      emit(_Error(error));
    });
  }

  static int pageSize = 20;
  static ProductsCubit get instance => getIt<ProductsCubit>();
  final ProductsUseCase productsUseCase;
}
