import 'dart:io';

import 'package:fruits_hub_dashboard/feature/add_product/data/models/review_model.dart';
import 'package:fruits_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

class Productmodel {
  final String nameEn;
  final String nameAr;

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
  final int sellingCount;
  final num averageRating = 0;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;

  Productmodel({
    required this.experationMonths,
    required this.reviews,
    required this.numbersOfCalories,
    required this.unitAmount,
    required this.nameEn,
    required this.nameAr,
    required this.isOrganic,
    required this.description,
    required this.price,
    required this.image,
    this.sellingCount = 0,
    required this.code,
    required this.isfeatured,
    this.imageurl,
  });
  factory Productmodel.fromEntity(ProductEntity entity) {
    return Productmodel(
      nameAr: entity.nameAr,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      isOrganic: entity.isOrganic,
      nameEn: entity.nameEn,
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
    'nameAr': nameAr,
    'nameEn': nameEn,
    'description': description,
    'price': price,
    'sellingCount': sellingCount,
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
