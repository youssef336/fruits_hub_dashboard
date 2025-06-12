import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/orders/precentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/feature/orders/precentation/views/widgets/order_item.dart';

import '../../../../../core/helper_functions/get_order_dummy_data.dart';
import '../../../data/models/order_model.dart';
import '../../../data/models/shipping_address_model.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const FilterSection(),
          const SizedBox(height: 16),
          OrderItemWidget(order: getDummyOrder()),
        ],
      ),
    );
  }
}
