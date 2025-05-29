import 'package:bloc/bloc.dart';

import 'package:fruits_hub_dashboard/feature/auth/domain/repo/login_repo.dart';
import 'package:fruits_hub_dashboard/feature/auth/presentation/manager/Login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    var result = await loginRepo.login(email, password);
    result.fold(
      (l) => emit(LoginfailureState(l.message)),
      (r) => emit(LoginSuccesState()),
    );
  }
}
