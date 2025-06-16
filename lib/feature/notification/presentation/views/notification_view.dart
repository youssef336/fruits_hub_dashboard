import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/feature/notification/presentation/manager/cubits/notification/notification_cubit.dart';

import '../../../../core/repos/notification_image_repo/notification_image_repo.dart';

import '../../domain/repo/notification_repo.dart';
import 'widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const String routeName = '/notification';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => NotificationCubit(
            getIt.get<NotificationImageRepo>(),
            getIt.get<NotificationRepo>(),
          ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Notification')),
        body: const NotificationViewBody(),
      ),
    );
  }
}
