class AddPaymentBM {
  int price;
  String description;

  AddPaymentBM({required this.price, required this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}
