import 'dart:developer';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/note.dart';
import 'package:medusa_admin/app/data/repository/note/base_note.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class NoteRepo extends BaseNote {
  final _dataProvider = DioClient(dio: Dio());

  /// Creates a Note which can be associated with any resource as required.
  @override
  Future<Result<UserNoteRes, Failure>> createNote({
    /// The ID of the resource which the Note relates to.
    required String resourceId,

    /// The type of resource which the Note relates to.
    required String resourceType,

    /// The content of the Note to create.
    required String value,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(uri: '/notes', data: {
        'resource_id': resourceId,
        'resource_type': resourceType,
        'value': value,
      });
      if (response.statusCode == 200) {
        return Success(UserNoteRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Deletes a Note
  @override
  Future<Result<UserDeleteNoteRes, Failure>> deleteNote({
    /// The ID of the Note to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/notes/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteNoteRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a single note using its id
  @override
  Future<Result<UserNoteRes, Failure>> retrieveNote({
    /// The ID of the note to retrieve.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/notes/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserNoteRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a single note using its id
  @override
  Future<Result<UserNotesRes, Failure>> retrieveNotes({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/notes',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserNotesRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Updates a Note associated with some resource
  @override
  Future<Result<UserNoteRes, Failure>> updateNote({
    /// The ID of the Note to update
    required String id,

    /// The updated description of the Note.
    required String value,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/notes/$id',
        data: {'value': value},
      );
      if (response.statusCode == 200) {
        return Success(UserNoteRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
