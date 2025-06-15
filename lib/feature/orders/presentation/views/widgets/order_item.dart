import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_product_entity.dart';

import '../../../../../core/enums/order_enum.dart';
import 'order_action_buttom.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderEntity order;

  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    String deliveryCost = order.paymentMethod == "PayPal" ? "Free" : "40\$";
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Order Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Total Price
                Row(
                  children: [
                    const Icon(Icons.attach_money, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      '\$${order.totalPrice.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // Status Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(order.status),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    order.status.name.toUpperCase(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
            ),
            Text('User ID: ${order.uID}'),

            Text('Payment Method: ${order.paymentMethod}'),
            Text('deliveryCost: $deliveryCost'),

            const SizedBox(height: 12),

            /// Shipping Address
            Text(
              'Shipping Address',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '${order.shippingAddress.name}, ${order.shippingAddress.phone}',
            ),
            Text(order.shippingAddress.toString()),

            const SizedBox(height: 12),

            /// Products List
            Text(
              'Products',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...order.orderProducts.map((product) => _buildProductItem(product)),
            const SizedBox(height: 16),
            OrderActionButtom(order: order),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(OrderProductEntity product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          /// Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
            ),
          ),
          const SizedBox(width: 12),

          /// Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.nameEn,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Code: ${product.code}'),
                Text(
                  'Qty: ${product.quantity}  |  \$${product.price.toStringAsFixed(2)}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(OrderEnum status) {
    switch (status) {
      case OrderEnum.pending:
        return Colors.orange;
      case OrderEnum.accepted:
        return Colors.green;
      case OrderEnum.delivered:
        return Colors.blue;
      case OrderEnum.canceled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
