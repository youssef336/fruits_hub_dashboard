import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/build_bar.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_modal_progress_hub.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/manager/add_product_cubit/add_product_state.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {
        if (state is AddProductfailure) {
          buildBar(context, state.message);
        }
        if (state is AddProductSuccess) {
          buildBar(context, 'Product Added Successfully');
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is AddProductLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
