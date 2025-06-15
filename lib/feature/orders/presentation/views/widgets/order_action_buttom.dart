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
        if (order.status == OrderEnum.pending) ...[
          _buildActionButton(
            context,
            'Accept',
            OrderEnum.accepted,
            Colors.green,
          ),
          const SizedBox(width: 30),
          _buildActionButton(context, 'Reject', OrderEnum.canceled, Colors.red),
        ],
        if (order.status == OrderEnum.accepted)
          _buildActionButton(
            context,
            'Delivered',
            OrderEnum.delivered,
            Colors.blue,
          ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    OrderEnum status,
    Color color,
  ) {
    return TextButton(
      onPressed: () {
        context.read<UpdateOrderCubit>().updateOrderStatus(
          orderId: order.orderId,
          status: status,
        );
      },
      style: TextButton.styleFrom(
        side: BorderSide(color: color),
        backgroundColor: color,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: Colors.black.withValues(alpha: 0.5),
        elevation: 5,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.pressed)) {
            return color.withOpacity(0.7);
          }
          return color;
        }),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
