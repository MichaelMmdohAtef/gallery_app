import 'package:dio/dio.dart';
import 'package:gallery_app/core/networking/api_service.dart';
import 'package:gallery_app/features/home/data/models/get_gallery_model.dart';
import 'package:gallery_app/features/login/logic/cubit/login_cubit.dart';




class GetImagesRemoteDataSource {
  final ApiService _apiService;
  final Dio _dio;

  GetImagesRemoteDataSource(this._apiService, this._dio);

  Future<GetGalleryModel> getImageFromRemoteData() async {
    _dio.options.headers = {
      "Authorization": "Bearer ${LoginCubit.loginUserData!.token ?? ""}"
    };
    final response = await _apiService.getImages();
    return response;
  }
}
