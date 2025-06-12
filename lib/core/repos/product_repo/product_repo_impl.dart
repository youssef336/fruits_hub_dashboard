import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_servies.dart';
import 'package:fruits_hub_dashboard/core/utils/back_end_endpoints.dart';
import 'package:fruits_hub_dashboard/feature/add_product/data/models/product_model.dart';
import 'package:fruits_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

class AddProductRepoImpl implements AddProductRepo {
  final DatabaseServies databaseServies;
  AddProductRepoImpl(this.databaseServies);
  @override
  Future<Either<Failure, void>> addProduct(
    ProductEntity addProductInputEntity,
  ) async {
    try {
      await databaseServies.addData(
        path: BackEndEndpoints.addproduct,
        data: Productmodel.fromEntity(addProductInputEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(const ServerFailure("Failed to add product"));
    }
  }
}
