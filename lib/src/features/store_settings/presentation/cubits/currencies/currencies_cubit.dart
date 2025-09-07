import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/store_settings/domain/usecases/currency/currencies_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'currencies_state.dart';

part 'currencies_cubit.freezed.dart';

@injectable
class CurrenciesCubit extends Cubit<CurrenciesState> {
  CurrenciesCubit(CurrenciesUseCase currenciesUseCase)
      : _useCase = currenciesUseCase,
        super(const _Initial());

  Future<void> loadAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    emit(const _Loading());
    final result = await _useCase(queryParameters: {
      'limit': pageSize,
      ...?queryParameters,
    });
    result.when(
      (response) => emit(_Currencies(response.currencies, response.count)),
      (e) => emit(_Error(e)),
    );
  }

  final CurrenciesUseCase _useCase;
  static int pageSize = 10;

  static CurrenciesCubit get instance => getIt<CurrenciesCubit>();
}
