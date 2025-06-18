import 'dart:io';

import 'package:fruits_hub_dashboard/feature/notification/domain/entities/notification_entity.dart';
import 'package:uuid/uuid.dart';

class NotificationModel {
  final String descriptioninEnglish;
  final File image;
  final String imageUrl;
  final DateTime date;
  final String descriptioninArabic;
  final String notificationId;
  final String code;
  final int discount;
  NotificationModel({
    required this.code,
    required this.discount,
    required this.notificationId,
    required this.descriptioninEnglish,
    required this.descriptioninArabic,
    required this.imageUrl,

    required this.image,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'discount': discount,
      'notificationId': notificationId,
      'descriptionEnglish': descriptioninEnglish,
      'descriptionArabic': descriptioninArabic,
      'image': imageUrl,
      'date': date,
    };
  }

  factory NotificationModel.fromEntity(NotificationEntity notificationEntity) {
    return NotificationModel(
      code: notificationEntity.code,
      discount: notificationEntity.discount,
      notificationId: const Uuid().v4(),
      descriptioninArabic: notificationEntity.descriptionInArabic,
      imageUrl: notificationEntity.imageUrl ?? '',
      descriptioninEnglish: notificationEntity.descriptioninEnglish,

      image: notificationEntity.image,
      date: notificationEntity.date,
    );
  }
}
