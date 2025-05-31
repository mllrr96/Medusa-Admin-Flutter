import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_api_client/gen.dart';

import 'di.dart';

@singleton
class MedusaClient {
  MedusaAdminClient get client => MedusaAdminClient(
        Dio(),
        baseUrl: 'http://localhost:9000',
      );

  static final MedusaClient instance = getIt<MedusaClient>();
}
