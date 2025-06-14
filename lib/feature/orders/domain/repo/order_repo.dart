import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class OrderRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrderss();
}
