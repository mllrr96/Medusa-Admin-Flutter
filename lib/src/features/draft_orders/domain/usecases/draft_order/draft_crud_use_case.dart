import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DraftCrudUseCase {
  DraftOrdersRepository get _draftRepository => _medusaAdminV2.draftOrders;
  final MedusaAdminV2 _medusaAdminV2;

  DraftCrudUseCase(this._medusaAdminV2);
  static DraftCrudUseCase get instance => getIt<DraftCrudUseCase>();

  Future<Result<DraftOrder, MedusaError>> retrieveDraftOrder({
    required String id,
    String? fields,
  }) async {
    try {
      final result = await _draftRepository.getDraftOrder(
          id, fields: fields );
      return Success(result.draftOrder);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }


  Future<Result<DraftOrderListResponse, MedusaError>> retrieveDraftOrders({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _draftRepository.getDraftOrders();
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Unit, MedusaError>> cancelDraft({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
       await _draftRepository.cancelEdit(id);
      return Success(unit);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<DraftOrder, MedusaError>> update({
    required String id,
    required UpdateDraftOrder payload,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.updateDraftOrder(id, payload);
      return Success(result.draftOrder);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<DraftOrder, MedusaError>> create({
    required PostDraftOrdersReq payload,
    String? fields,
  }) async {
    try {
      final result = await _draftRepository.createDraftOrder(payload, fields: fields);
      return Success(result.draftOrder);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  // Future<Result<Order, MedusaError>> registerPayment({
  //   required String id,
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   try {
  //     final result = await _draftRepository.registerPayment(id);
  //     return Success(result);
  //   } on DioException catch (e) {
  //     return Error(MedusaError.fromHttp(
  //       status: e.response?.statusCode,
  //       body: e.response?.data,
  //       cause: e,
  //     ));
  //   } catch (error) {
  //     return Error(
  //         MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
  //   }
  // }
}
