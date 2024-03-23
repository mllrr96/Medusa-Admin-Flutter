import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/product/product_variants_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'product_variants_state.dart';
part 'product_variants_cubit.freezed.dart';

@injectable
class ProductVariantsCubit extends Cubit<ProductVariantsState> {
  ProductVariantsCubit(ProductVariantsUseCase productVariantsUseCase)
      : _useCase = productVariantsUseCase,
        super(const _Initial());

  Future<void> retrieveProductVariants(
      {Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await _useCase(queryParameters: {
      'limit': pageSize,
      ...?queryParameters,
    });
    result.when(
      (success) {
        emit(_Variants(success.variants ?? [], success.count ?? 0));
      },
      (error) {
        emit(_Error(error));
      },
    );
  }

  final ProductVariantsUseCase _useCase;
  static int pageSize = 20;
  static ProductVariantsCubit get instance => getIt<ProductVariantsCubit>();
}
