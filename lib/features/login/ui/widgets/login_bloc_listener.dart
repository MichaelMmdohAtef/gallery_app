import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/helpers/extensions.dart';
import 'package:gallery_app/core/theming/styles.dart';
import 'package:gallery_app/features/login/logic/cubit/login_cubit.dart';
import 'package:gallery_app/features/login/logic/cubit/login_state.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is EmitLoadingLoginStates) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),
            ),
          );
        } else if (state is EmitSuccessLoginStates) {
          context.pop(context);
          context.pushNamedAndRemoveUntil(context, Routes.homeScreen,
              predicate: (route) => false);
        } else if (state is EmitErrorLoginStates) {
          setupErrorState(context, state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font20BlackBaloosemiBold,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop(context);
            },
            child: Text(
              'Got it',
              style: TextStyles.font27BlackBold,
            ),
          ),
        ],
      ),
    );
  }
}
