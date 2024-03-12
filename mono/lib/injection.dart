import 'package:get_it/get_it.dart';
import 'package:mono/Data/Sources/auth_data_source.dart';
import 'package:mono/Data/Sources/home_data_source.dart';
import 'package:mono/Hive/hive_boxs_manager.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerLazySingleton(() => HiveBoxsManager());
  getIt.registerLazySingleton(() => AuthDataSource());
  getIt.registerLazySingleton(() => HomeDataSource());

}
