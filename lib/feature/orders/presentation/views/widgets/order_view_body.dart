import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/widgets/order_item_list_view.dart';

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
          const FilterSection(),
          const SizedBox(height: 16),
          Expanded(child: OrderItemListView(orderList: orders)),
        ],
      ),
    );
  }
}
