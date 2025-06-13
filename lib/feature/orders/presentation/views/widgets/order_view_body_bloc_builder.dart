import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper_functions/get_order_dummy_data.dart';
import '../../manager/cubits/fetchorder/fetch_order_cubit.dart';
import 'order_view_body.dart';

class OrderViewBodyBlocBuilder extends StatefulWidget {
  const OrderViewBodyBlocBuilder({super.key});

  @override
  State<OrderViewBodyBlocBuilder> createState() =>
      _OrderViewBodyBlocBuilderState();
}

class _OrderViewBodyBlocBuilderState extends State<OrderViewBodyBlocBuilder> {
  @override
  void initState() {
    context.read<FetchorderCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchorderCubit, FetchorderState>(
      builder: (context, state) {
        if (state is FetchorderError) {
          return Center(child: Text(state.message));
        }
        if (state is FetchorderSuccess) {
          return OrderViewBody(orders: state.orders);
        } else {
          return Skeletonizer(
            child: OrderViewBody(
              orders: [getDummyOrder(), getDummyOrder(), getDummyOrder()],
            ),
          );
        }
      },
    );
  }
}
