import 'dart:io';

class NotificationModel {
  final String description;
  final File image;
  final String date;

  NotificationModel({
    required this.description,
    required this.image,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'image': image.path,
      'date': date,
    };
  }
}
