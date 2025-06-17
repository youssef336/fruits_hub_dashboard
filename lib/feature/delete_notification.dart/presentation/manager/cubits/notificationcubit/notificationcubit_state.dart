part of 'notificationcubit_cubit.dart';

abstract class NotificationcubitStateDelete {
  const NotificationcubitStateDelete();
}

class NotificationcubitInitial extends NotificationcubitStateDelete {}

class NotificationcubitSuccess extends NotificationcubitStateDelete {
  final List<NotificationEntity> notifications;
  NotificationcubitSuccess(this.notifications);
}

class NotificationcubitError extends NotificationcubitStateDelete {
  final String message;
  NotificationcubitError(this.message);
}

class NotificationcubitLoading extends NotificationcubitStateDelete {}
