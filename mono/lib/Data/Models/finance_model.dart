class FinanceModel {
  String? username;
  List<FinanceData>? data;

  FinanceModel({this.username, this.data});

  FinanceModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    if (json['data'] != null) {
      data = <FinanceData>[];
      json['data'].forEach((v) {
        data!.add(FinanceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}

class FinanceData {
  String? image;
  String? title;
  String? subtitle;
  bool? isExpense;
  int? price;

  FinanceData({this.image, this.title, this.subtitle, this.isExpense, this.price});

  FinanceData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    subtitle = json['subtitle'];
    isExpense = json['isExpense'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['isExpense'] = isExpense;
    data['price'] = price;
    return data;
  }
}
