import 'package:dartz/dartz.dart';
import 'dart:io';

import '../../../../core/errors/failures.dart';

abstract class NotificationRepo {
  Future<Either<Failure, void>> addNotification({
    required String description,
    required File image,
    required DateTime date,
  });
}
