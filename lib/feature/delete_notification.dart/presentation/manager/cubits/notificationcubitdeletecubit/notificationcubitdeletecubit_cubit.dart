import 'package:bloc/bloc.dart';

import '../../../../domain/repo/notification_repo.dart';

part 'notificationcubitdeletecubit_state.dart';

class NotificationdeleteCubit extends Cubit<NotificationdeletecubitState> {
  final NotificationRepoDelete notificationRepo;

  NotificationdeleteCubit(this.notificationRepo)
    : super(NotificationcubitdeletecubitInitial());

  Future<void> deleteNotification(String notificationId) async {
    emit(NotificationdeletecubitLoading());
    var result = await notificationRepo.deleteNotification(
      notificationId: notificationId,
    );
    result.fold(
      (failure) => emit(NotificationdeletecubitError(failure.message)),
      (r) => emit(NotificationdeletecubitSuccess()),
    );
  }
}
