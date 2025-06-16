import 'dart:io';

import 'package:fruits_hub_dashboard/feature/notification/domain/entities/notification_entity.dart';

class NotificationModel {
  final String descriptioninEnglish;
  final File image;
  final String imageUrl;
  final DateTime date;
  final String descriptioninArabic;

  NotificationModel({
    required this.descriptioninEnglish,
    required this.descriptioninArabic,
    required this.imageUrl,

    required this.image,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'descriptionEnglish': descriptioninEnglish,
      'descriptionArabic': descriptioninArabic,
      'image': imageUrl,
      'date': date,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      imageUrl: json['image'],
      descriptioninEnglish: json['descriptionEnglish'],
      descriptioninArabic: json['descriptionArabic'],
      image: json['image'],
      date: json['date'],
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      imageUrl: imageUrl,
      descriptioninEnglish: descriptioninEnglish,
      descriptionInArabic: descriptioninArabic,
      image: image,
      date: date,
    );
  }

  factory NotificationModel.fromEntity(NotificationEntity notificationEntity) {
    return NotificationModel(
      imageUrl: notificationEntity.imageUrl ?? '',
      descriptioninEnglish: notificationEntity.descriptioninEnglish,
      descriptioninArabic: notificationEntity.descriptionInArabic,
      image: notificationEntity.image,
      date: notificationEntity.date,
    );
  }
}
