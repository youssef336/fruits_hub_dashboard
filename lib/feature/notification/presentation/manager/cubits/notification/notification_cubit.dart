import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/notification/domain/usecases/add_notification.dart';
import 'package:fruits_hub_dashboard/feature/notification/presentation/manager/cubits/notification/notification_state.dart';
import 'dart:io';

class NotificationCubit extends Cubit<NotificationState> {
  final AddNotification _addNotification;

  NotificationCubit(this._addNotification) : super(const NotificationInitial());

  Future<void> addNotification({
    required String description,
    required File image,
    required DateTime date,
  }) async {
    emit(const NotificationLoading());

    final result = await _addNotification(
      AddNotificationParams(description: description, image: image, date: date),
    );

    result.fold(
      (failure) => emit(NotificationFailure(message: failure.message)),
      (_) => emit(const NotificationSuccess()),
    );
  }
}
