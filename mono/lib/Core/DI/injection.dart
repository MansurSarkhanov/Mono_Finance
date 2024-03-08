import 'package:get_it/get_it.dart';
import 'package:mono/Core/Hive/hive_boxs_manager.dart';
import 'package:mono/Data/auth_data_source.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerLazySingleton(() => HiveBoxsManager());
  getIt.registerLazySingleton(() => AuthDataSource());
}
