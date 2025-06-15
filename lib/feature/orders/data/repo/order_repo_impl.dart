import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';

import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/mains/database_servies.dart';

import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';

import '../../../../core/utils/back_end_endpoints.dart';
import '../../domain/repo/order_repo.dart';
import '../models/order_model.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseServies databaseServies;

  OrderRepoImpl(this.databaseServies);

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrderss() async* {
    try {
      await for (var (data as List<Map<String, dynamic>>) in databaseServies
          .streamData(path: BackEndEndpoints.getOrder)) {
        List<OrderEntity> orders =
            (data as List<dynamic>)
                .map((e) => OrderModel.fromJson(e).toEntity())
                .toList();

        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderStatus({
    required OrderEnum status,
    required String orderId,
  }) async {
    try {
      await databaseServies.updateData(
        path: BackEndEndpoints.updateOrderStatus,
        documentId: orderId,
        data: {'status': status.name},
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
