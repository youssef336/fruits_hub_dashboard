import 'package:flutter/material.dart';

import 'package:fruits_hub_dashboard/feature/orders/presentation/manager/cubits/fetchorder/fetch_order_cubit.dart';

class FilterSection extends StatelessWidget {
  final FetchorderCubit cubit;

  const FilterSection({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 300,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      cubit.fetchOrdersSortedByDate();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sort by Date',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      cubit.fetchOrders();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Remove Filter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Row(
        children: [
          Icon(Icons.filter_list),
          SizedBox(width: 8),
          Text(
            'Filter',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
