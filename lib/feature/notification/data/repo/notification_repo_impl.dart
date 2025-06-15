import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/utils/back_end_endpoints.dart';
import 'package:fruits_hub_dashboard/feature/notification/data/models/notification_model.dart';
import 'dart:io';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/mains/database_servies.dart';
import '../../domain/repo/notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final DatabaseServies databaseServies;
  NotificationRepoImpl(this.databaseServies);
  @override
  Future<Either<Failure, void>> addNotification({
    required String description,
    required File image,
    required DateTime date,
  }) async {
    final notificationModel = NotificationModel(
      description: description,
      image: image,
      date: date.toString(),
    );

    try {
      // First upload the image
      final imageResult = await databaseServies.uploadFile(
        path: 'notifications/${DateTime.now().millisecondsSinceEpoch}',
        file: image,
      );
      
      if (imageResult.isLeft()) {
        return Left(imageResult.fold((l) => l, (r) => ServerFailure('Failed to upload image')));
      }
      
      final imageUrl = imageResult.getOrElse(() => '');
      
      // Then create the notification with the image URL
      final notificationData = notificationModel.toJson()..['imageUrl'] = imageUrl;
      
      final result = await databaseServies.addData(
        path: BackEndEndpoints.addNotification,
        data: notificationData,
      );
      
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
