import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helper_functions/build_bar.dart';
import '../../manager/cubits/notificationcubitdeletecubit/notificationcubitdeletecubit_cubit.dart';

class DeleteBlockBuilder extends StatelessWidget {
  const DeleteBlockBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationdeleteCubit, NotificationdeletecubitState>(
      builder: (context, state) {
        if (state is NotificationdeletecubitError) {
          buildBar(context, state.error);
        }
        if (state is NotificationdeletecubitSuccess) {
          return child;
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ModalProgressHUD(
            inAsyncCall: state is NotificationdeletecubitLoading ? true : false,
            child: child,
          ),
        );
      },
    );
  }
}
