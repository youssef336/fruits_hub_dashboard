part of 'update_order_cubit.dart';

@immutable
abstract class UpdateOrderState {}

class UpdateOrderInitial extends UpdateOrderState {}

class UpdateOrderLoading extends UpdateOrderState {}

class UpdateOrderSuccess extends UpdateOrderState {}

class UpdateOrderError extends UpdateOrderState {
  final String message;
  UpdateOrderError({required this.message});
}
