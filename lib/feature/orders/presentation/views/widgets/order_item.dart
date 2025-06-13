import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';
import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_product_entity.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderEntity order;

  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Order Info
            Text(
              'Order ID: ${order.uID}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text('Total Price: \$${order.totalPrice.toStringAsFixed(2)}'),
            Text('Payment Method: ${order.paymentMethod}'),

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
}
