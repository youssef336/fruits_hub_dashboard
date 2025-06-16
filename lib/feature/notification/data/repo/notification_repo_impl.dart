import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/utils/back_end_endpoints.dart';
import 'package:fruits_hub_dashboard/feature/notification/data/models/notification_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/mains/database_servies.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repo/notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final DatabaseServies databaseServies;
  NotificationRepoImpl(this.databaseServies);

  @override
  Future<Either<Failure, void>> addNotification({
    required NotificationEntity notificationEntity,
  }) async {
    try {
      await databaseServies.addData(
        path: BackEndEndpoints.addNotification,
        data: NotificationModel.fromEntity(notificationEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
