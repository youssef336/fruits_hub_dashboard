import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = '/add-product';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AddProductViewBody());
  }
}
