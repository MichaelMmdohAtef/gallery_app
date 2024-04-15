import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/features/home/data/models/get_gallery_model.dart';
import 'package:gallery_app/features/home/data/repos/home_repo.dart';
import 'package:gallery_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(InitialHomeStates());

  GetGalleryModel? galleryModel;
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> emitUploadImage(FormData formData) async {
    emit(EmitLoadingUploadImageStates());
    final response = await _homeRepo.uploadImage(formData);
    response.when(success: (response) async {
      await emitGetImages();
      emit(EmitSuccessUploadImageStates(successMessage: response.message!));
    }, failure: (error) {
      emit(EmitErrorUploadImageStates(
          errorMessage: error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> emitGetImages() async {
    emit(EmitLoadingGetImageStates());
    final response = await _homeRepo.getImage();
    response!.when(success: (getImageResponse) {
      galleryModel = getImageResponse;
      emit(EmitSuccessGetImageStates());
    }, failure: (error) {
      emit(EmitErrorGetImageStates(
          errorMessage: error.apiErrorModel.message ?? ""));
    });
  }
}
