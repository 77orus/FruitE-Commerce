import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruietecommerceapp/core/helpers/dependency_injection.dart';
import 'package:fruietecommerceapp/core/widgets/custom_app_bar.dart';
import 'package:fruietecommerceapp/core/widgets/show_toast.dart';
import 'package:fruietecommerceapp/features/auth/domain/repository/auth_repo.dart';
import 'package:fruietecommerceapp/features/auth/logic/signIn_cubit/cubit/signin_cubit.dart';
import 'package:fruietecommerceapp/features/auth/ui/widgets/login_screen_body.dart';
import 'package:fruietecommerceapp/features/home/ui/screens/home_Screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = "login_screen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepository>()),
      child: Scaffold(
        appBar: BuildAppBar(context, title: "تسجيل الدخول"),
        body: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninErrors) {
              showToast(state.error, ToastType.error);
            } else if (state is SigninSuccess) {
              showToast("تم تسجيل الدخول بنجاح", ToastType.success);
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SigninLoading ? true : false,
              child: const LoginScreenBody(),
            );
          },
        ),
      ),
    );
  }
}
