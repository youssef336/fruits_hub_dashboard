part of 'notificationcubitdeletecubit_cubit.dart';

abstract class NotificationdeletecubitState {}

class NotificationcubitdeletecubitInitial
    extends NotificationdeletecubitState {}

class NotificationdeletecubitLoading extends NotificationdeletecubitState {}

class NotificationdeletecubitSuccess extends NotificationdeletecubitState {}

class NotificationdeletecubitError extends NotificationdeletecubitState {
  final String error;
  NotificationdeletecubitError(this.error);
}
