import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/tax_settings/domain/usecases/tax_provider/tax_provider_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'tax_regions_state.dart';

part 'tax_regions_cubit.freezed.dart';

@injectable
class TaxRegionsCubit extends Cubit<TaxRegionsState> {
  TaxRegionsCubit(TaxRegionUseCase taxProviderUseCase)
      : _useCase = taxProviderUseCase,
        super(const _Initial());

  Future<void> fetch() async {
    emit(const _Loading());
    final result = await _useCase();
    result.when(
      (taxProviders) => emit(_Loaded(taxProviders)),
      (error) => emit(_Error(error)),
    );
  }

  final TaxRegionUseCase _useCase;

  static TaxRegionsCubit get instance => getIt<TaxRegionsCubit>();
}
