import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ProductsFilterUseCase {
  final MedusaAdminV2 _medusaAdmin;

  ProductsFilterUseCase(this._medusaAdmin);
  static ProductsFilterUseCase get instance => getIt<ProductsFilterUseCase>();
  CollectionsRepository get _collectionRepository =>_medusaAdmin .collections;
  ProductTagsRepository get _productTagRepository =>  _medusaAdmin.productTags;

  Future<Result<(CollectionListRes, ProductTagListResponse), MedusaError>>
  call() async {
    try {
      final collections = await _collectionRepository.retrieveAll();
      final tags = await _productTagRepository.list();
      return Success((collections, tags));
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
