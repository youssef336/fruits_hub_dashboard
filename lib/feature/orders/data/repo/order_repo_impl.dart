import 'package:dartz/dartz.dart';

import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/database_servies.dart';

import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';

import '../../../../core/utils/back_end_endpoints.dart';
import '../../domain/repo/order_repo.dart';
import '../models/order_model.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseServies databaseServies;

  OrderRepoImpl(this.databaseServies);

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrderss() async {
    try {
      final data = await databaseServies.getData(
        path: BackEndEndpoints.getOrder,
      );
      List<OrderEntity> orders =
          (data as List<dynamic>)
              .map((e) => OrderModel.fromJson(e).toEntity())
              .toList();

      return Right(orders);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
