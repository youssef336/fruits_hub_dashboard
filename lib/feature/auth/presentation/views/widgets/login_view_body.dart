import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_dashboard/feature/auth/presentation/manager/Login_cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormFeild(
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              suffixIcon: null,
              maxLines: 1,
              onSaved: (p0) {
                email = p0!;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormFeild(
              hintText: "Password",
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: null,
              maxLines: 1,
              onSaved: (p0) {
                password = p0!;
              },
            ),
            const SizedBox(height: 20),
            CustomButtom(
              text: 'Login',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<LoginCubit>().login(email, password);
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
