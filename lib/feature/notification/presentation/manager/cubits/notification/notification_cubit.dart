import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/notification/domain/entities/notification_entity.dart';

import 'package:fruits_hub_dashboard/feature/notification/presentation/manager/cubits/notification/notification_state.dart';

import '../../../../../../core/repos/notification_image_repo/notification_image_repo.dart';

import '../../../../domain/repo/notification_repo.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.imageRepo, this.notificationRepo)
    : super(const NotificationInitial());
  final NotificationImageRepo imageRepo;
  final NotificationRepo notificationRepo;

  Future<void> addNotification(
    NotificationEntity addNotificationInputEntity,
  ) async {
    emit((const NotificationLoading()));
    var result = await imageRepo.uploadImage(addNotificationInputEntity.image);
    result.fold(
      (failure) => emit(NotificationFailure(message: failure.message)),
      (url) async {
        addNotificationInputEntity.imageUrl = url;
        var result = await notificationRepo.addNotification(
          notificationEntity: addNotificationInputEntity,
        );
        result.fold(
          (failure) => emit(NotificationFailure(message: failure.message)),
          (r) {
            emit(const NotificationSuccess());
          },
        );
      },
    );
  }
}
