import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/repo/order_repo.dart';

import '../../../../domain/entieties/order_entity.dart';

part 'fetch_order_state.dart';

class FetchorderCubit extends Cubit<FetchorderState> {
  FetchorderCubit(this.orderRepo) : super(FetchorderInitial());
  final OrderRepo orderRepo;
  StreamSubscription? _subscription;
  void fetchOrders() {
    emit(FetchorderLoading());
    _subscription = orderRepo.fetchOrderss().listen((result) {
      result.fold(
        (l) => emit(FetchorderError(l.message)),
        (r) => emit(FetchorderSuccess(r)),
      );
    });
  }

  void fetchOrdersSortedByDate() {
    emit(FetchorderLoading());
    _subscription = orderRepo.fetchOrderssSortedByDate().listen((result) {
      result.fold(
        (l) => emit(FetchorderError(l.message)),
        (r) => emit(FetchorderSuccess(r)),
      );
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
