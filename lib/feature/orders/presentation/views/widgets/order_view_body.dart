import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/order_item_list_view.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/manager/cubits/fetchorder/fetch_order_cubit.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          FilterSection(cubit: context.read<FetchorderCubit>()),
          const SizedBox(height: 16),
          Expanded(child: OrderItemListView(orderList: orders)),
        ],
      ),
    );
  }
}
