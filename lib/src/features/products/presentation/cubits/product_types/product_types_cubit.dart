import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/products/domain/usecases/product/product_type_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'product_types_state.dart';
part 'product_types_cubit.freezed.dart';

@injectable
class ProductTypesCubit extends Cubit<ProductTypesState> {
  ProductTypesCubit(this.productTypeUseCase) : super(const _Initial());

  Future<void> load({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await productTypeUseCase(queryParameters: queryParameters);
    result.when((success) => emit(_Types(success.productTypes, success.count)),
        (error) => emit(_Error(error)));
  }

  final ProductTypeUseCase productTypeUseCase;
  static ProductTypesCubit get instance => getIt<ProductTypesCubit>();
}
