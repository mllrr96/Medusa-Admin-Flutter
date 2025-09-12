import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

@lazySingleton
class InventoryCrudUseCase {
  final MedusaAdminV2 _medusaAdmin;

  InventoryCrudUseCase(this._medusaAdmin);

  static InventoryCrudUseCase get instance => getIt<InventoryCrudUseCase>();
}
