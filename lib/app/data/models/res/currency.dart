import '../store/currency.dart';
import 'common.dart';

class UserCurrencyRes extends PaginatedResponse {
  List<Currency>? currencies;

  UserCurrencyRes.fromJson(json) : super.fromJson(json) {
    if (json['currencies'] != null) {
      currencies = <Currency>[];
      json['currencies'].forEach((v) {
        currencies?.add(Currency.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['currencies'] = currencies?.map((e) => e.toJson()).toList() ?? [];
    return data;
  }
}
