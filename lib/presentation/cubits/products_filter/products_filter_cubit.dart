import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/product/products_filter_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'products_filter_state.dart';
part 'products_filter_cubit.freezed.dart';

@injectable
class ProductsFilterCubit extends Cubit<ProductsFilterState> {
  ProductsFilterCubit(this.productsFilterUseCase) : super(const _Initial()) {
    loadData();
  }

  Future<void> loadData() async {
    emit(const ProductsFilterState.loading());
    final result = await productsFilterUseCase();

    result.when((success) {
      emit(ProductsFilterState.loaded(
          success.$1.collections ?? [], success.$2.tags ?? []));
    }, (error) {
      emit(ProductsFilterState.error(error));
    });
  }

  final ProductsFilterUseCase productsFilterUseCase;
  static ProductsFilterCubit get instance => getIt<ProductsFilterCubit>();
}
