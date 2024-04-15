
class LoginState{}

class InitialLoginStates extends LoginState{}

class EmitLoadingLoginStates extends LoginState {}
class EmitSuccessLoginStates extends LoginState {}
class EmitErrorLoginStates extends LoginState {
  String errorMessage;
  EmitErrorLoginStates({required this.errorMessage});
}
