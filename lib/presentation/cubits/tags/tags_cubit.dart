import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/discount/tags_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'tags_state.dart';
part 'tags_cubit.freezed.dart';

@injectable
class TagsCubit extends Cubit<TagsState> {
  TagsCubit(TagsUseCase tagsUseCase)
      : _useCase = tagsUseCase,
        super(const _Initial());

  void fetchTags({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await _useCase(queryParameters: queryParameters);
    result.when((success) => _Tags(success.tags ?? [], success.count ?? 0),
        (error) => _Error(error));
  }

  final TagsUseCase _useCase;
  static TagsCubit get instance => getIt<TagsCubit>();
}
