import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/note.dart';

abstract class BaseNote {
  Future<Result<UserNoteRes, Failure>> createNote({
    required String resourceId,
    required String resourceType,
    required String value,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserNoteRes, Failure>> retrieveNote({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserNoteRes, Failure>> updateNote({
    required String id,
    required String value,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteNoteRes, Failure>> deleteNote({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserNotesRes, Failure>> retrieveNotes({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
}
