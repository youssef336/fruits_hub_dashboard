import 'package:dartz/dartz.dart';
import 'dart:io';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repo/notification_repo.dart';

class AddNotification extends UseCase<Either<Failure, void>, AddNotificationParams> {
  final NotificationRepo notificationRepo;

  AddNotification(this.notificationRepo);

  @override
  Future<Either<Failure, void>> call(AddNotificationParams params) async {
    return notificationRepo.addNotification(
      description: params.description,
      image: params.image,
      date: params.date,
    );
  }
}

class AddNotificationParams {
  final String description;
  final File image;
  final DateTime date;

  AddNotificationParams({
    required this.description,
    required this.image,
    required this.date,
  });
}
