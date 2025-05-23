import 'dart:io';

import 'package:fruits_hub_dashboard/feature/add_product/data/models/review_model.dart';
import 'package:fruits_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/feature/add_product/domain/entities/review_entity.dart';

class AddProductInputmodel {
  final String name;
  final String description;
  final num price;
  final File image;
  final String code;
  final bool isfeatured;
  String? imageurl;
  final int experationMonths;
  final bool isOrganic;
  final int numbersOfCalories;
  final int unitAmount;
  final num averageRating = 0;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;

  AddProductInputmodel({
    required this.experationMonths,
    required this.reviews,
    required this.numbersOfCalories,
    required this.unitAmount,
    required this.name,
    required this.isOrganic,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
    required this.isfeatured,
    this.imageurl,
  });
  factory AddProductInputmodel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputmodel(
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      isOrganic: entity.isOrganic,
      name: entity.name,
      experationMonths: entity.experationMonths,
      numbersOfCalories: entity.numbersOfCalories,
      unitAmount: entity.unitAmount,

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
    'code': code,
    'isfeatured': isfeatured,
    'imageurl': imageurl,
    'experationMonths': experationMonths,
    'isOrganic': isOrganic,
    'numbersOfCalories': numbersOfCalories,
    'unitAmount': unitAmount,
    'reviews': reviews.map((e) => e.toJson()).toList(),
  };
}
