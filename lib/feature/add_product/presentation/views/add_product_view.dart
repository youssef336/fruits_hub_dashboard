import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/add_product_view_body_bloc_consumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = '/add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: build_appbar('Add Product'),
      body: BlocProvider(
        create:
            (context) => AddProductCubit(
              getIt.get<ImageRepo>(),
              getIt.get<AddProductRepo>(),
            ),
        child: const AddProductViewBodyBlocConsumer(),
      ),
    );
  }
}
