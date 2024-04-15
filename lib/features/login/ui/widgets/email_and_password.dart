import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/theming/colors.dart';
import 'package:gallery_app/core/theming/styles.dart';
import 'package:gallery_app/core/widgets/app_text_button.dart';
import 'package:gallery_app/core/widgets/frosted_glass_box.dart';
import 'package:gallery_app/features/login/logic/cubit/login_cubit.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return FrostedGlassBox(
      height: 388.h,
      width: 345.w,
      borderRadius: 32,
      child: Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpace(48),
            SizedBox(
              height: 40.h,
              child: Text(
                "LOG IN",
                style: TextStyles.font30BlackBold,
              ),
            ),
            verticalSpace(38),
            AppTextFormField(
              hintText: 'User Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid email';
                }
              },
              controller: context.read<LoginCubit>().emailController,
            ),
            verticalSpace(38),
            AppTextFormField(
              controller: context.read<LoginCubit>().passwordController,
              hintText: 'Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
            ),
            verticalSpace(38),
            AppTextButton(
                buttonText: "SUBMIT",
                textStyle: TextStyles.font18WhitesemiBold,
                backgroundColor: ColorsManager.mainBlue,
                borderRadius: 10,
                buttonHeight: 46.h,
                buttonWidth: 282.w,
                onPressed: () => validateThenDoLogin(context))
          ],
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
