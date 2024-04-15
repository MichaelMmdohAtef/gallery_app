import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/helpers/extensions.dart';
import 'package:gallery_app/core/theming/styles.dart';
import 'package:gallery_app/features/home/logic/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/logic/cubit/home_state.dart';
import '../../../../core/theming/colors.dart';

class HomeBlocListener extends StatelessWidget {
  const HomeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is EmitLoadingUploadImageStates) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),
            ),
          );
        } else if (state is EmitSuccessUploadImageStates) {
          context.pop(context);
          context.pop(context);
          setupErrorOrSuccessState(context, state.successMessage,
              isError: false);
        } else if (state is EmitErrorUploadImageStates) {
          context.pop(context);
          setupErrorOrSuccessState(context, state.errorMessage);
        } else if (state is EmitLoadingGetImageStates) {
        } else if (state is EmitSuccessGetImageStates) {
        } else if (state is EmitErrorGetImageStates) {
          setupErrorOrSuccessState(context, state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorOrSuccessState(BuildContext context, String error,
      {bool isError = true}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: isError
            ? const Icon(
                Icons.error,
                color: Colors.red,
                size: 32,
              )
            : const SizedBox.shrink(),
        content: Text(
          error,
          textAlign: TextAlign.center,
          style: TextStyles.font20BlackBaloosemiBold,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop(context);
            },
            child: Text(
              'Got it',
              textAlign: TextAlign.center,
              style: TextStyles.font27BlackBold,
            ),
          ),
        ],
      ),
    );
  }
}
