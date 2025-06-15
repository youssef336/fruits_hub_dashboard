import '../../../../core/enums/order_enum.dart';
import 'order_product_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final String uID;
  final String orderId;
  final double totalPrice;
  final ShippingAddressEntity shippingAddress;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrderEnum status;

  OrderEntity({
    required this.orderId,
    required this.status,
    required this.uID,
    required this.totalPrice,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
  });
}
