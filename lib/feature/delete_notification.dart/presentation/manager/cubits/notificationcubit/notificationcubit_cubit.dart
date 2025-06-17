import 'package:bloc/bloc.dart';

import '../../../../domain/entities/notification_entity.dart';
import '../../../../domain/repo/notification_repo.dart';

part 'notificationcubit_state.dart';

class NotificationcubitCubitDelete extends Cubit<NotificationcubitStateDelete> {
  final NotificationRepoDelete notificationRepo;

  NotificationcubitCubitDelete(this.notificationRepo)
    : super(NotificationcubitInitial());

  void addNotification() async {
    emit(NotificationcubitLoading());
    var result = await notificationRepo.getNotifications();
    result.fold((failure) => emit(NotificationcubitError(failure.message)), (
      notifications,
    ) {
      emit(NotificationcubitSuccess(notifications));
    });
  }
}
