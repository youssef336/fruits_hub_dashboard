import 'dart:io';

import 'package:fruits_hub_dashboard/feature/add_product/domain/entities/review_entity.dart';

class AddProductInputEntity {
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
  final List<ReviewEntity> reviews;

  AddProductInputEntity({
    required this.experationMonths,
    required this.unitAmount,
    required this.numbersOfCalories,
    required this.name,
    required this.description,
    required this.reviews,
    required this.price,
    required this.image,
    required this.code,
    required this.isfeatured,
    this.isOrganic = false,
    this.imageurl,
  });
}
