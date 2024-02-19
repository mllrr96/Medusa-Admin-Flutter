import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/sales_channel/sales_channels_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'sales_channels_state.dart';
part 'sales_channels_cubit.freezed.dart';

@injectable
class SalesChannelsCubit extends Cubit<SalesChannelsState> {
  SalesChannelsCubit(this.salesChannelsUseCase) : super(const _Initial());

  Future<void> load({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await salesChannelsUseCase(queryParameters: queryParameters);
    result.when(
        (success) => emit(
            _SalesChannels(success.salesChannels ?? [], success.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  final SalesChannelsUseCase salesChannelsUseCase;
  static SalesChannelsCubit get instance => getIt<SalesChannelsCubit>();
}
