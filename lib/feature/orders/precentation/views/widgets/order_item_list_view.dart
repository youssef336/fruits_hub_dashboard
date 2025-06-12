import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';
import 'package:fruits_hub_dashboard/feature/orders/precentation/views/widgets/order_item.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orderList});
  final List<OrderEntity> orderList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(order: orderList[index]);
      },
    );
  }
}
