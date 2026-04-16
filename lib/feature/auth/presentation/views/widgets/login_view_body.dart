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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String email, password;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              controller: _emailController,
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
              controller: _passwordController,
              hintText: "Password",
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: null,
              maxLines: 1,
              onSaved: (p0) {
                password = p0!;
              },
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _emailController.text = 'gg@gmail.com';
                _passwordController.text = '123456789';
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFD9D9D9)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Demo Login For Portfolio Testing',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 6),
                    Text('Email: gg@gmail.com'),
                    Text('Password: 123456789'),
                    SizedBox(height: 4),
                    Text('Tap here to auto-fill credentials'),
                  ],
                ),
              ),
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
