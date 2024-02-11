import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/group/groups_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'groups_state.dart';
part 'groups_cubit.freezed.dart';

@injectable
class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit(this.groupsUseCase) : super(const _Initial());

  Future<void> loadGroups({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await groupsUseCase.retrieveCustomerGroups(queryParameters: {
      'limit': pageSize,
      'expand': 'customers',
      ...?queryParameters,
    });
    result.when((response) {
      emit(_Groups(response.customerGroups!, response.count ?? 0));
    }, (error) {
      emit(_Error(error));
    });
  }

  static int pageSize = 20;
  final GroupsUseCase groupsUseCase;
  static GroupsCubit get instance => getIt<GroupsCubit>();
}
