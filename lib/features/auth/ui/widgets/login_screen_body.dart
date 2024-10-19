import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruietecommerceapp/core/images/imagesApp.dart';
import 'package:fruietecommerceapp/core/utils/app_colors.dart';
import 'package:fruietecommerceapp/core/utils/text_theme.dart';
import 'package:fruietecommerceapp/core/widgets/custom_elevated_button.dart';
import 'package:fruietecommerceapp/core/widgets/custom_text_form_filed.dart';
import 'package:fruietecommerceapp/features/auth/logic/signIn_cubit/cubit/signin_cubit.dart';
import 'package:fruietecommerceapp/features/auth/ui/screens/register_screen.dart';
import 'package:fruietecommerceapp/features/auth/ui/widgets/custom_signin_with.dart';
import 'package:fruietecommerceapp/features/auth/ui/widgets/or_divider.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: emailController,
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "البريد الالكتروني مطلوب";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: passwordController,
                hintText: "كلمة المرور",
                obscureText: isSecure,
                suffixIcon: IconButton(
                  onPressed: () {
                    isSecure = !isSecure;
                    setState(() {});
                  },
                  icon: Icon(
                    isSecure ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.greyColor,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "البريد الالكتروني مطلوب";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 33),
              CustomElevatedButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<SigninCubit>().signInWithEmailAndPassword(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                  }
                },
              ),
              const SizedBox(height: 33),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'لا تمتلك حساب؟',
                      style: TextStyles.bold16.copyWith(
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                      text: "قم بإنشاء حساب",
                      style: TextStyles.bold16.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 53),
              const OrDivider(),
              const SizedBox(height: 31),
              CustomSignInWith(
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                text: "تسجيل  بواسطة جوجل",
                image: Assets.imagesGoogle,
              ),
              const SizedBox(height: 16),
              CustomSignInWith(
                onPressed: () {},
                text: "تسجيل  بواسطة أبل",
                image: Assets.imagesApple,
              ),
              const SizedBox(height: 16),
              CustomSignInWith(
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
                text: "تسجيل  بواسطة فيسبوك",
                image: Assets.imagesFacbook,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
