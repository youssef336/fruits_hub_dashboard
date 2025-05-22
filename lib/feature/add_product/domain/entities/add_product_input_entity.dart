import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String description;
  final num price;
  final File image;
  final String code;
  final bool isfeatured;
  final String? imageurl;

  AddProductInputEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
    required this.isfeatured,
    this.imageurl,
  });
}
