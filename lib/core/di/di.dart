import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async => await getIt.init();
