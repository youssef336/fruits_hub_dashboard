import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';

import '../../../../core/enums/order_enum.dart';
import '../../../../core/errors/failures.dart';

abstract class OrderRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrderss();
  Stream<Either<Failure, List<OrderEntity>>> fetchOrderssSortedByDate();

  Future<Either<Failure, void>> updateOrderStatus({
    required OrderEnum status,
    required String orderId,
  });
}
