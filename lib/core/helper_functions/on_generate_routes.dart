import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/feature/auth/presentation/views/Login_view.dart';

import '../../feature/home/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
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
