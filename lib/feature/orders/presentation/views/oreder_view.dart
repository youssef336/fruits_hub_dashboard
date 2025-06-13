import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../domain/repo/order_repo.dart';
import '../manager/cubits/fetchorder/fetch_order_cubit.dart';
import 'widgets/order_view_body_bloc_builder.dart';

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
