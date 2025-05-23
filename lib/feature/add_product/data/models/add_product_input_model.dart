import 'dart:io';

import 'package:fruits_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputmodel {
  final String name;
  final String description;
  final num price;
  final File image;
  final String code;
  final bool isfeatured;
  String? imageurl;

  AddProductInputmodel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
    required this.isfeatured,
    this.imageurl,
  });
  factory AddProductInputmodel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputmodel(
      name: entity.name,
      description: entity.description,
      price: entity.price,
      image: entity.image,
      code: entity.code,
      isfeatured: entity.isfeatured,
      imageurl: entity.imageurl,
    );
  }
  toJson() => {
    'name': name,
    'description': description,
    'price': price,
    'image': image,
    'code': code,
    'isfeatured': isfeatured,
    'imageurl': imageurl,
  };
}
