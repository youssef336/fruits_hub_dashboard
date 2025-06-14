import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/build_bar.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/manager/cubits/update_order/update_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateOrderBuilder extends StatelessWidget {
  const UpdateOrderBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          buildBar(context, "Order Updated Successfully");
        }
        if (state is UpdateOrderError) {
          buildBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateOrderLoading,
          child: child,
        );
      },
    );
  }
}
