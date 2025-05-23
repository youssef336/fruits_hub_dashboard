import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';

abstract class AddProductRepo {
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  );
}
