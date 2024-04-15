
class HomeState{}

class InitialHomeStates extends HomeState {}

class EmitLoadingUploadImageStates extends HomeState {}
class EmitSuccessUploadImageStates extends HomeState {
    String successMessage;
  EmitSuccessUploadImageStates({required this.successMessage});
}
class EmitErrorUploadImageStates extends HomeState {
  String errorMessage;
  EmitErrorUploadImageStates({required this.errorMessage});
}

class EmitLoadingGetImageStates extends HomeState {}
class EmitSuccessGetImageStates extends HomeState {}
class EmitErrorGetImageStates extends HomeState {
  String errorMessage;
  EmitErrorGetImageStates({required this.errorMessage});
}

