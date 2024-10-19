import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruietecommerceapp/core/helpers/dependency_injection.dart';
import 'package:fruietecommerceapp/core/widgets/custom_app_bar.dart';
import 'package:fruietecommerceapp/core/widgets/show_toast.dart';
import 'package:fruietecommerceapp/features/auth/domain/repository/auth_repo.dart';
import 'package:fruietecommerceapp/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:fruietecommerceapp/features/auth/ui/widgets/register_Screen_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt.get<AuthRepository>()),
      child: Scaffold(
        appBar: BuildAppBar(context, title: "حساب جديد"),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterError) {
              showToast(
                state.error,
                ToastType.error,
              );
            } else if (state is RegisterSuccess) {
              showToast(
                "تم التسجيل بنجاح يمكنك الان تسجيل الدخول",
                ToastType.success,
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is RegisterLoading ? true : false,
              child: const RegisterScreenBody(),
            );
          },
        ),
      ),
    );
  }
}
