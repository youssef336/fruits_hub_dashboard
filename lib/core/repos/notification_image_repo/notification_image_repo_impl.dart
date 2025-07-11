import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';

import 'package:fruits_hub_dashboard/core/repos/notification_image_repo/notification_image_repo.dart';
import 'package:fruits_hub_dashboard/core/services/mains/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/back_end_endpoints.dart';

class NotificationImageRepoImpl implements NotificationImageRepo {
  final StorageService storageService;

  NotificationImageRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadFile(
        image,
        BackEndEndpoints.notificationimagePath,
      );
      return right(url);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
