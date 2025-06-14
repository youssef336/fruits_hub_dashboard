import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/repo/order_repo.dart';

import '../../../../domain/entieties/order_entity.dart';

part 'fetch_order_state.dart';

class FetchorderCubit extends Cubit<FetchorderState> {
  FetchorderCubit(this.orderRepo) : super(FetchorderInitial());
  final OrderRepo orderRepo;
  void fetchOrders() async {
    emit(FetchorderLoading());
    await for (var result in orderRepo.fetchOrderss()) {
      result.fold(
        (l) => emit(FetchorderError(l.message)),
        (r) => emit(FetchorderSuccess(r)),
      );
    }
  }
}
