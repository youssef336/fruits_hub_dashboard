import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/feature/auth/domain/repo/login_repo.dart';
import 'package:fruits_hub_dashboard/feature/auth/presentation/manager/Login_cubit/login_cubit.dart';
import 'package:fruits_hub_dashboard/feature/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => LoginCubit(getIt.get<LoginRepo>()),
          child: LoginViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
