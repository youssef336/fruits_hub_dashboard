import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';

import '../../../../../core/enums/order_enum.dart';
import '../../manager/cubits/update_order/update_order_cubit.dart';

class OrderActionButtom extends StatelessWidget {
  const OrderActionButtom({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: order.status == OrderEnum.pending,
          child: TextButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                orderId: order.orderId,
                status: OrderEnum.accepted,
              );
            },
            style: TextButton.styleFrom(
              side: const BorderSide(color: Colors.green),
              backgroundColor: Colors.green,
              padding: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Accept',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 30),
        Visibility(
          visible: order.status == OrderEnum.pending,
          child: TextButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                orderId: order.orderId,
                status: OrderEnum.canceled,
              );
            },
            style: TextButton.styleFrom(
              side: const BorderSide(color: Colors.red),
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Reject',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Visibility(
          visible: order.status == OrderEnum.accepted,
          child: TextButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                orderId: order.orderId,
                status: OrderEnum.delivered,
              );
            },
            style: TextButton.styleFrom(
              side: const BorderSide(color: Colors.blue),
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Delivered',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
