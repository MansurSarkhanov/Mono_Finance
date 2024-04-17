class FinanceModel {
  String? id;
  String? image;
  bool? isExpense;
  String? price;
  String? title;
  String? subtitle;

  FinanceModel({this.id, this.image, this.isExpense, this.price, this.title, this.subtitle});

  FinanceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isExpense = json['isExpense'];
    price = json['price'];
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['isExpense'] = isExpense;
    data['price'] = price;
    data['title'] = title;
    data['subtitle'] = subtitle;
    return data;
  }
}
