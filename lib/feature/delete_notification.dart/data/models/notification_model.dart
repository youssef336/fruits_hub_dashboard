import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/domain/entities/notification_entity.dart';

class NotificationModel {
  final String descriptioninEnglish;
  final String descriptioninArabic;
  final String imageUrl;
  final DateTime date;
  final String notificationId;

  NotificationModel({
    required this.notificationId,
    required this.descriptioninEnglish,
    required this.descriptioninArabic,
    required this.imageUrl,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationId: json['notificationId'],
      descriptioninArabic: json['descriptionArabic'],
      descriptioninEnglish: json['descriptionEnglish'],
      imageUrl: json['image'],
      date: (json['date'] as Timestamp).toDate(),
    );
  }

  factory NotificationModel.fromEntity(NotificationEntity entity) {
    return NotificationModel(
      notificationId: entity.notificationId,
      descriptioninArabic: entity.descriptioninArabic,
      descriptioninEnglish: entity.descriptioninEnglish,
      imageUrl: entity.imageUrl,
      date: entity.date,
    );
  }

  NotificationEntity toEntity() => NotificationEntity(
    notificationId: notificationId,
    descriptioninArabic: descriptioninArabic,
    descriptioninEnglish: descriptioninEnglish,
    imageUrl: imageUrl,
    date: date,
  );
}
