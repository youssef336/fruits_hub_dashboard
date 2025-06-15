import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/add_product_view.dart';

import '../../../../notification/presentation/views/notification_view.dart';
import '../../../../orders/presentation/views/oreder_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtom(
            text: 'Add Product',
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
          ),
          const SizedBox(height: 16),
          CustomButtom(
            text: 'Order View',
            onPressed: () {
              Navigator.pushNamed(context, OrderView.routeName);
            },
          ),
          const SizedBox(height: 16),
          CustomButtom(
            text: 'New Notification',
            onPressed: () {
              Navigator.pushNamed(context, NotificationView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
