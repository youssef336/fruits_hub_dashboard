import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/presentation/manager/cubits/notificationcubit/notificationcubit_cubit.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/presentation/manager/cubits/notificationcubitdeletecubit/notificationcubitdeletecubit_cubit.dart';

import 'package:intl/intl.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../domain/entities/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});
  final NotificationEntity notification;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The main row content
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 59,
              height: 59,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(notification.imageUrl),
                  fit: BoxFit.cover,
                ),
                shape: const OvalBorder(),
              ),
            ),
            const SizedBox(width: 13),
            SizedBox(
              width: 219,
              child: Text(
                notification.descriptioninEnglish,
                style: AppTextStyles.bodyBaseSemibold.copyWith(height: 1.40),
              ),
            ),
            const SizedBox(width: 13),
            SizedBox(
              width: 50,
              child: Column(
                children: [
                  Text(
                    DateFormat.jm().format(notification.date),
                    style: AppTextStyles.bodySmallSemibold1.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                  Text(
                    DateFormat.yMd().format(notification.date),
                    style: AppTextStyles.bodySmallSemibold1.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Positioned delete icon
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              context.read<NotificationdeleteCubit>().deleteNotification(
                notification.notificationId,
              );
              context.read<NotificationcubitCubitDelete>().addNotification();
            },
          ),
        ),
      ],
    );
  }
}
