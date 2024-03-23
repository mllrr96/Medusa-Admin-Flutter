import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class NoteCrudUseCase {
  NoteRepository get _noteRepository => getIt<MedusaAdmin>().noteRepository;

  static NoteCrudUseCase get instance => getIt<NoteCrudUseCase>();

  Future<Result<Note, Failure>> load(String id) async {
    try {
      final result = await _noteRepository.retrieveNote(id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Note, Failure>> create({
    required String resourceId,
    required String resourceType,
    required String value,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      final result = await _noteRepository.createNote(
        resourceId: resourceId,
        resourceType: resourceType,
        value: value,
        customHeaders: customHeaders,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Note, Failure>> update(String id, String value) async {
    try {
      final result = await _noteRepository.updateNote(
        id: id,
        value: value,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserDeleteNoteRes, Failure>> delete(String id) async {
    try {
      final result = await _noteRepository.deleteNote(
        id: id,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserNotesRes, Failure>> loadAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _noteRepository.retrieveNotes(
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
