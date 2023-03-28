import 'package:medusa_admin/app/data/models/store/address.dart';


class UserCreateStockLocationReq {
  /// the name of the stock location
  final String name;

  /// the stock location address ID
  final String? addressId;

  /// Represents a Stock Location Address Input
  final Address? address;

  UserCreateStockLocationReq({required this.name, this.address, this.addressId});
}
