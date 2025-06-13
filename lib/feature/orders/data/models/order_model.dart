import 'package:fruits_hub_dashboard/feature/orders/domain/entieties/order_entity.dart';

import 'order_product_model.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final String uID;
  final double totalPrice;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.uID,
    required this.totalPrice,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    uID: json['uID'],
    totalPrice: json['totalPrice'],
    shippingAddress: ShippingAddressModel.fromJson(json['shippingAddress']),
    orderProducts: List<OrderProductModel>.from(
      json['orderProducts'].map((e) => OrderProductModel.fromJson(e)),
    ),
    paymentMethod: json['paymentMethod'],
  );
  toJson() => {
    'uID': uID,
    'totalPrice': totalPrice,
    'status': 'Pending',
    'date': DateTime.now().toString(),
    'shippingAddress': shippingAddress.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };

  OrderEntity toEntity() => OrderEntity(
    uID: uID,
    totalPrice: totalPrice,
    shippingAddress: shippingAddress.toEntity(),
    orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
    paymentMethod: paymentMethod,
  );
}
