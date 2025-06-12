import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/precentation/views/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String routeName = '/oreder-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Orders')),
      body: const OrderViewBody(),
    );
  }
}
