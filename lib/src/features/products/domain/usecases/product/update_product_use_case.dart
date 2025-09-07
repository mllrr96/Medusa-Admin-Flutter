import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateProductUseCase {
  final MedusaAdminV2 _medusaAdmin;

  UpdateProductUseCase(this._medusaAdmin);

  ProductsRepository get _productsRepository => _medusaAdmin.products;

  ProductTypesRepository get _typeRepository => _medusaAdmin.productTypes;

  CollectionsRepository get _collectionRepository => _medusaAdmin.collections;

  UploadsRepository get _uploadRepository => _medusaAdmin.uploads;

  SalesChannelsRepository get _salesChannelRepository => _medusaAdmin.salesChannels;

  static UpdateProductUseCase get instance => getIt<UpdateProductUseCase>();

  Future<Result<Product, MedusaError>> addProduct(CreateProductReq payload) async {
    try {
      final result = await _productsRepository.create(payload);
      return Success(result.product);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Product, MedusaError>> updateProduct({
    required UpdateProductReq userPostUpdateProductReq,
    required String id,
  }) async {
    try {
      final result = await _productsRepository.update(id, userPostUpdateProductReq);
      return Success(result.product);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductTypeListResponse, MedusaError>> retrieveProductTypes(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _typeRepository.list(query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<CollectionListRes, MedusaError>> retrieveCollections(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _collectionRepository.retrieveAll(queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<List<String>, MedusaError>> uploadFile(List<File> files) async {
    throw UnimplementedError();
    // try {
    //   final result = await _uploadRepository.create(files);
    //   return Success(result);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error, stack) {
    //   if (kDebugMode) {
    //     log(error.toString());
    //     log(stack.toString());
    //   }
    //   return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }

  Future<Result<UploadsDeleteRes, MedusaError>> deleteFile({required String fileKey}) async {
    try {
      final result = await _uploadRepository.delete(fileKey);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<SalesChannelListRes, MedusaError>> retrieveSalesChannels(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _salesChannelRepository.retrieveAll(queryParameters: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error, stack) {
      if (kDebugMode) {
        log(error.toString());
        log(stack.toString());
      }
      return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
