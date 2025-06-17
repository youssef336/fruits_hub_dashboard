import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/domain/entities/notification_entity.dart';

import 'notification_item.dart';

class NotificationItemListView extends StatelessWidget {
  const NotificationItemListView({super.key, required this.notifications});
  final List<NotificationEntity> notifications;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        notifications.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: NotificationItem(notification: notifications[index]),
        ),
      ),
    );
  }
}
