import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrdersFilterUseCase {
  final MedusaAdminV2 _medusaAdmin;

  OrdersFilterUseCase(this._medusaAdmin);

  static OrdersFilterUseCase get instance => getIt<OrdersFilterUseCase>();

  RegionsRepository get _regionsRepository => _medusaAdmin.regions;

  SalesChannelsRepository get _salesChannelRepository => _medusaAdmin.salesChannels;

  Future<Result<(RegionsRes, SalesChannelListRes), MedusaError>> call() async {
    try {
      final regions = await _regionsRepository.retrieveAll();
      final channels = await _salesChannelRepository.retrieveAll();
      return Success((regions, channels));
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
