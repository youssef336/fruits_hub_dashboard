import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../domain/repo/order_repo.dart';
import '../manager/cubits/fetchorder/fetch_order_cubit.dart';
import '../manager/cubits/update_order/update_order_cubit.dart';
import 'widgets/order_view_body_bloc_builder.dart';
import 'widgets/update_order_builder.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String routeName = '/oreder-view';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchorderCubit(getIt.get<OrderRepo>()),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(getIt.get<OrderRepo>()),
        ),
      ],

      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Orders')),
        body: const UpdateOrderBuilder(child: OrderViewBodyBlocBuilder()),
      ),
    );
  }
}
