import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/feature/auth/presentation/views/Login_view.dart';
import 'package:fruits_hub_dashboard/feature/notification/presentation/views/notification_view.dart';
import 'package:fruits_hub_dashboard/feature/orders/presentation/views/oreder_view.dart';

import '../../feature/home/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OrderView.routeName:
      return MaterialPageRoute(builder: (_) => const OrderView());
    case NotificationView.routeName:
      return MaterialPageRoute(builder: (_) => const NotificationView());
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    // Replace with actual OnBoarding view
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
