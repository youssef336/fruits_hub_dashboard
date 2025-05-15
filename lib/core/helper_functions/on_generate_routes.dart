import 'package:flutter/material.dart';

import '../../feature/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());

    // Replace with actual OnBoarding view
    default:
      return MaterialPageRoute(builder: (_) => const DashboardView());
  }
}
