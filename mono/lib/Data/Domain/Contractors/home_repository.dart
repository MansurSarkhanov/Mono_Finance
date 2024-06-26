import 'package:mono/Data/Models/finance_model.dart';
import 'package:mono/Data/Models/user_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IHomeRepository {
  Future<Result<UserModel?, bool>> fetcUserInfo();
  Future<Result<FinanceModel?, bool>> getUserFinance();

}
