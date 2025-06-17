import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/domain/entities/notification_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/mains/database_servies.dart';
import '../../../../core/utils/back_end_endpoints.dart';
import '../../domain/repo/notification_repo.dart';
import '../models/notification_model.dart';

class NotificationRepoImplDelete implements NotificationRepoDelete {
  final DatabaseServies databaseServies;
  NotificationRepoImplDelete(this.databaseServies);

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    try {
      var data =
          await databaseServies.getData(path: BackEndEndpoints.getNotifications)
              as List<Map<String, dynamic>>;
      List<NotificationEntity> notifications =
          (data as List<dynamic>)
              .map((e) => NotificationModel.fromJson(e).toEntity())
              .toList();
      return Right(notifications);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNotification({
    required String notificationId,
  }) async {
    try {
      await databaseServies.deleteData(
        path: BackEndEndpoints.deleteNotification,
        id: notificationId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
