import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruietecommerceapp/core/utils/app_colors.dart';
import 'package:fruietecommerceapp/core/utils/app_regex.dart';
import 'package:fruietecommerceapp/core/utils/text_theme.dart';
import 'package:fruietecommerceapp/core/widgets/custom_elevated_button.dart';
import 'package:fruietecommerceapp/core/widgets/custom_text_form_filed.dart';
import 'package:fruietecommerceapp/core/widgets/show_toast.dart';
import 'package:fruietecommerceapp/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:fruietecommerceapp/features/auth/ui/widgets/password_validation.dart';
import 'package:fruietecommerceapp/features/auth/ui/widgets/terms_and_conditions.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  bool isTermsAccepted = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController;

  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  bool isSecure = true;

  @override
  void initState() {
    passwordController = TextEditingController();
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.isHasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.isHasUperCase(passwordController.text);
        hasNumber = AppRegex.isHasNumber(passwordController.text);
        hasSpecialCharacter =
            AppRegex.isHasSpecialCharacter(passwordController.text);
        hasMinLength = AppRegex.isHasMinLength(passwordController.text);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                controller: nameController,
                keyboardType: TextInputType.name,
                hintText: "الأسم كامل",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "من فضلك ادخل الاسم الخاص بك";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: emailController,
                hintText: "البريد الالكتروني",
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
                keyboardType: TextInputType.visiblePassword,
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
                validator: (value) {
                  if (value!.isEmpty ||
                      hasLowerCase == false ||
                      hasUpperCase == false ||
                      hasMinLength == false ||
                      hasNumber == false ||
                      hasSpecialCharacter == false) {
                    return "الرقم السري  غير صالح انظر الشروط";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditions(
                isCheckedChange: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 16),
              PasswordValidation(
                  hasUpperCase: hasUpperCase,
                  hasLowerCase: hasLowerCase,
                  hasNumber: hasNumber,
                  hasSpecialCharacter: hasSpecialCharacter,
                  hasMinLength: hasMinLength),
              const SizedBox(height: 30),
              CustomElevatedButton(
                text: "إنشاء حساب جديد",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (isTermsAccepted) {
                      context
                          .read<RegisterCubit>()
                          .createUserWithEmailAndPassword(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                    } else {
                      showToast(
                        "يجب عليك الموافقة علي الشروط والاحكام",
                        ToastType.error,
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تمتلك حساب بالفعل؟",
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "تسجيل دخول",
                        style: TextStyles.bold16.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
