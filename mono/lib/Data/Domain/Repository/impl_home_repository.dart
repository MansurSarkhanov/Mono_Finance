import 'package:mono/Data/Domain/Contractors/home_repository.dart';
import 'package:mono/Data/Models/finance_model.dart';
import 'package:mono/Data/Models/user_model.dart';
import 'package:mono/Data/Sources/home_data_source.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../injection.dart';

class ImpleHomeRepository implements IHomeRepository {
  final _homeDataSource = getIt.get<HomeDataSource>();
  @override
  Future<Result<UserModel?, bool>> fetcUserInfo() async {
    try {
      final response = await _homeDataSource.fetcUserInfo();
      return Success(response);
    } catch (e) {
      const Error(true);
    }
    return const Error(true);
  }

  @override
  Future<Result<FinanceModel?, bool>> getUserFinance() async {
    try {
      final response = await _homeDataSource.getUserFinance();
      
      return Success(response);
    } catch (e) {
      const Error(true);
    }
    return const Error(true);
  }
}
