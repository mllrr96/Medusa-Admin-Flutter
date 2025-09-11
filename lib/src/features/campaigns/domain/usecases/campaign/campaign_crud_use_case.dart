
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CampaignCrudUseCase {
  CampaignsRepository get _campaignsRepository => _medusaAdminV2.campaigns;
  final MedusaAdminV2 _medusaAdminV2;

  CampaignCrudUseCase(this._medusaAdminV2);

  static CampaignCrudUseCase get instance => getIt<CampaignCrudUseCase>();

  Future<Result<CampaignsListRes, MedusaError>> retrieveCampaigns(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _campaignsRepository.list(
        queryParameters: queryParameters,
      );
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Campaign, MedusaError>> retrieveCampaign(
       String id) async {
    try {
      final result = await _campaignsRepository.retrieve(
       id,
      );
      return Success(result.campaign);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<bool, MedusaError>> deleteCampaign({required String id}) async {
    try {
      await _campaignsRepository.delete(id);
      return Success(true);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Campaign, MedusaError>> createCampaign({
    required CreateCampaignReq payload,
  }) async {
    try {
      final result = await _campaignsRepository.create(payload);
      return Success(result.campaign);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Campaign, MedusaError>> updateCampaign({
    required String id,
    required UpdateCampaignReq payload,
  }) async {
    try {
      final result = await _campaignsRepository.update(id, payload);
      return Success(result.campaign);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
