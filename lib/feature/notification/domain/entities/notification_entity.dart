import 'dart:io';

class NotificationEntity {
  final String description;
  String? imageUrl;
  final File image;

  final DateTime date;

  NotificationEntity({
    required this.image,
    required this.description,
    this.imageUrl,
    required this.date,
  });
}
