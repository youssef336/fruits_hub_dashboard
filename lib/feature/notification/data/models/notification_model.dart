import 'dart:io';

import 'package:fruits_hub_dashboard/feature/notification/domain/entities/notification_entity.dart';

class NotificationModel {
  final String description;
  final File image;
  final DateTime date;

  NotificationModel({
    required this.description,
    required this.image,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {'description': description, 'image': image.path, 'date': date};
  }

  factory NotificationModel.fromEntity(NotificationEntity notificationEntity) {
    return NotificationModel(
      description: notificationEntity.description,
      image: notificationEntity.image,
      date: notificationEntity.date,
    );
  }
}
