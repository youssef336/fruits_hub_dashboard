import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/get_order_dummy_data.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/order_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/services/get_it_service.dart';
import '../../domain/repo/order_repo.dart';
import '../manager/cubits/fetchorder/fetch_order_cubit.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String routeName = '/oreder-view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchorderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Orders')),
        body: const OrderViewBodyBlocBuilder(),
      ),
    );
  }
}

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
