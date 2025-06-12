class OrderProductModel {
  final String nameEn;
  final String nameAr;
  final String imageUrl;
  final String code;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.nameEn,
    required this.nameAr,
    required this.imageUrl,
    required this.code,
    required this.price,
    required this.quantity,
  });
  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      OrderProductModel(
        nameEn: json['nameEn'],
        nameAr: json['nameAr'],
        imageUrl: json['imageUrl'],
        code: json['code'],
        price: json['price'],
        quantity: json['quantity'],
      );
  toJson() => {
    'nameEn': nameEn,
    'nameAr': nameAr,
    'imageUrl': imageUrl,
    'code': code,
    'price': price,
    'quantity': quantity,
  };
}
