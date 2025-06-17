class NotificationEntity {
  final String descriptioninEnglish;
  final String descriptioninArabic;
  final String imageUrl;
  final String notificationId;
  final DateTime date;

  NotificationEntity({
    required this.notificationId,
    required this.descriptioninEnglish,
    required this.descriptioninArabic,
    required this.imageUrl,
    required this.date,
  });
}
