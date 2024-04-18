import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/features/login/data/models/login_request_body.dart';
import 'package:gallery_app/features/login/data/models/login_response.dart';
import 'package:gallery_app/features/login/data/repos/login_repo.dart';
import 'package:gallery_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(InitialLoginStates());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  static LoginResponse? loginUserData;

  void emitLoginStates() async {
    emit(EmitLoadingLoginStates());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) {
      loginUserData = loginResponse;
      // emit(EmitErrorLoginStates(
      //     errorMessage:
      //         "${loginUserData!.token} ${emailController.text} ${passwordController.text} " ));
      emit(EmitSuccessLoginStates());
    }, failure: (error) {
      emit(EmitErrorLoginStates(
          errorMessage: error.apiErrorModel.message ?? ""));
    });
  }
}
