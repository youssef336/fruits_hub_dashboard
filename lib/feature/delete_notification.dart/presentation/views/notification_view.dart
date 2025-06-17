import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/presentation/manager/cubits/notificationcubit/notificationcubit_cubit.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/presentation/views/widgets/delete_block_builder.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/presentation/views/widgets/notification_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/helper_functions/build_bar.dart';

class NotificationViewDelete extends StatelessWidget {
  const NotificationViewDelete({super.key});
  static const routeName = '/notificationdelete';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: const NotificationViewBodyBlockBuilder(),
    );
  }
}

class NotificationViewBodyBlockBuilder extends StatelessWidget {
  const NotificationViewBodyBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      NotificationcubitCubitDelete,
      NotificationcubitStateDelete
    >(
      listener: (context, state) {
        if (state is NotificationcubitError) {
          buildBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is NotificationcubitSuccess) {
          return DeleteBlockBuilder(
            child: NotificationViewBody(notifications: state.notifications),
          );
        }

        // Show empty data or placeholder instead of error
        return ModalProgressHUD(
          inAsyncCall: state is NotificationcubitLoading ? true : false,
          child: const NotificationViewBody(notifications: []),
        );
      },
    );
  }
}
