import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits_hub_dashboard/core/services/custom_bolc_observer.dart';
import 'package:fruits_hub_dashboard/core/services/firebase_auth.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage.dart';

import 'package:fruits_hub_dashboard/feature/auth/presentation/views/Login_view.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/domain/repo/notification_repo.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/presentation/manager/cubits/notificationcubit/notificationcubit_cubit.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/presentation/manager/cubits/notificationcubitdeletecubit/notificationcubitdeletecubit_cubit.dart';
import 'package:fruits_hub_dashboard/feature/home/presentation/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/firebase_options.dart';

import 'core/helper_functions/on_generate_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorageServices.intSupabase();

  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => NotificationcubitCubitDelete(
                getIt.get<NotificationRepoDelete>(),
              ),
        ),
        BlocProvider(
          create:
              (context) =>
                  NotificationdeleteCubit(getIt.get<NotificationRepoDelete>()),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:
            isUserLoggedIn() ? DashboardView.routeName : LoginView.routeName,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
