import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/product/product_type_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'product_types_state.dart';
part 'product_types_cubit.freezed.dart';

@injectable
class ProductTypesCubit extends Cubit<ProductTypesState> {
  ProductTypesCubit(this.productTypeUseCase) : super(const _Initial());

  Future<void> load({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await productTypeUseCase(queryParameters: queryParameters);
    result.when(
        (success) =>
            emit(_Types(success.productTypes ?? [], success.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  final ProductTypeUseCase productTypeUseCase;
  static ProductTypesCubit get instance => getIt<ProductTypesCubit>();
}
