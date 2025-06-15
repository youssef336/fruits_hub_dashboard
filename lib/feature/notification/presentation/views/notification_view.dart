import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/notification/presentation/manager/cubits/notification/notification_cubit.dart';
import 'package:fruits_hub_dashboard/feature/notification/domain/usecases/add_notification.dart';
import 'package:get_it/get_it.dart';

import 'widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const String routeName = '/notification';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(GetIt.instance.get<AddNotification>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Notification')),
        body: const NotificationViewBody(),
      ),
    );
  }
}
