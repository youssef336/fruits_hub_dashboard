class OrderProductEntity {
  final String nameEn;
  final String nameAr;
  final String imageUrl;
  final String code;
  final double price;
  final int quantity;

  OrderProductEntity({
    required this.nameEn,
    required this.nameAr,
    required this.imageUrl,
    required this.code,
    required this.price,
    required this.quantity,
  });
}
