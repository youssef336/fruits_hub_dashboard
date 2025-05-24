import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/back_end_endpoints.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;

  ImageRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadFile(
        image,
        BackEndEndpoints.imagePath,
      );
      return right(url);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
