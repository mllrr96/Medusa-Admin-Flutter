// import 'package:injectable/injectable.dart';
// import 'package:medusa_admin/src/core/di/medusa_admin_di.dart';
// import 'package:medusa_admin/src/features/auth/data/service/auth_preference_service.dart';
// import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
//
// @module
// abstract class MedusaClient {
//
//   @singleton
//   final AuthPreferenceService _authPreferenceService = AuthPreferenceService() ;
//
//   @singleton
//   MedusaAdminV2 get client => MedusaAdminV2.initialize(
//         baseUrl: _authPreferenceService.baseUrl,
//         interceptors: [
//           MedusaAdminDi.loggerInterceptor,
//           MedusaAdminDi.authInterceptor,
//         ],
//       );
// }
