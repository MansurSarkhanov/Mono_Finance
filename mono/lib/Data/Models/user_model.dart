class UserModel {
  String? email;
  String? password;
  String? username;
  int? money;
  int? income;
  int? expenses;

  UserModel({this.email, this.password, this.username, this.money, this.income, this.expenses});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
    money = json['money'];
    income = json['income'];
    expenses = json['expense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    data['money'] = money;
    data['income'] = income;
    data['expense'] = expenses;
    return data;
  }
}
