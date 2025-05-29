import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/build_bar.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_modal_progress_hub.dart';
import 'package:fruits_hub_dashboard/feature/auth/presentation/manager/Login_cubit/login_cubit.dart';
import 'package:fruits_hub_dashboard/feature/auth/presentation/manager/Login_cubit/login_state.dart';
import 'package:fruits_hub_dashboard/feature/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruits_hub_dashboard/feature/home/presentation/views/dashboard_view.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginfailureState) {
          buildBar(context, "your are not Authorized");
        }
        if (state is LoginSuccesState) {
          buildBar(context, 'Login Successfully');
          // SupabaseStorageServices.createSupabaseBucket(KsupabaseBucket);
          Navigator.pushNamed(context, DashboardView.routeName);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is LoginLoadingState,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
