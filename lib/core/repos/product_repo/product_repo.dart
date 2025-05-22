import 'package:fruits_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';

abstract class AddProductRepo {
  Future<void> addProduct(AddProductInputEntity addProductInputEntity);
}
