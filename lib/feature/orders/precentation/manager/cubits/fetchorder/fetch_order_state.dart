import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';

sealed class FetchorderState {}

class FetchorderInitial extends FetchorderState {}

class FetchorderLoading extends FetchorderState {}

class FetchorderSuccess extends FetchorderState {
  final List<OrderEntity> orders;
  FetchorderSuccess(this.orders);
}

class FetchorderError extends FetchorderState {
  final String message;
  FetchorderError(this.message);
}
