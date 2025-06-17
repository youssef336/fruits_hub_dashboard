import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/notification_entity.dart';

abstract class NotificationRepoDelete {
  Future<Either<Failure, List<NotificationEntity>>> getNotifications();
  Future<Either<Failure, void>> deleteNotification({
    required String notificationId,
  });
}
