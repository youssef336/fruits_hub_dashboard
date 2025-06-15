import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/repo/order_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/enums/order_enum.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.orderRepo) : super(UpdateOrderInitial());
  final OrderRepo orderRepo;

  Future<void> updateOrderStatus({
    required OrderEnum status,
    required String orderId,
  }) async {
    emit(UpdateOrderLoading());
    final result = await orderRepo.updateOrderStatus(
      status: status,
      orderId: orderId,
    );
    result.fold(
      (l) => emit(UpdateOrderError(message: l.message)),
      (r) => emit(UpdateOrderSuccess()),
    );
  }
}
