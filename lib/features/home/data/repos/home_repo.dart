import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:gallery_app/core/networking/api_constants.dart';
import 'package:gallery_app/core/networking/api_error_handler.dart';
import 'package:gallery_app/core/networking/api_result.dart';
import 'package:gallery_app/core/networking/api_service.dart';
import 'package:gallery_app/features/home/data/models/get_gallery_model.dart';
import 'package:gallery_app/features/home/data/models/upload_image_response.dart';
import 'package:gallery_app/features/home/logic/data%20source/get_images_local_data.dart';
import 'package:gallery_app/features/home/logic/data%20source/get_images_remote_data.dart';
import 'package:gallery_app/features/login/logic/cubit/login_cubit.dart';

class HomeRepo {
  final ApiService _apiService;
  final Dio _dio;
  final GetImagesLocalDataSource _localData;
  final GetImagesRemoteDataSource _remoteData;

  HomeRepo(this._apiService, this._dio, this._localData, this._remoteData);

  Future<ApiResult<UploadImageResponse>> uploadImage(FormData formData) async {
    try {
      _dio
      .options.headers = {
        "Authorization": "Bearer ${LoginCubit.loginUserData!.token ?? ""}",
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      final response = await _apiService.uploadImage(formData);
      return ApiResult.success(response);
    } on DioException catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  Future<ApiResult<GetGalleryModel>> getImage() async {

    final connectivityResult = await Connectivity().checkConnectivity();
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      try {
        final response = await _remoteData.getImageFromRemoteData();
        await _localData.cacheImages(imagesToCach: response);
        return ApiResult.success(response);
      } on DioException catch (errro) {
        return ApiResult.failure(ErrorHandler.handle(errro));
      }
    } else {
      try {
        final response = await _localData.getImageFromLocalData();
        if (response.toString().isNotEmpty) {
          return ApiResult.success(response!);
        } else {
                  return ApiResult.failure(
              ErrorHandler.handle("cache exception is empty"));
        }
      } catch (e) {
        return ApiResult.failure(
            ErrorHandler.handle("cache exception is empty"));
      }
    }
  }
}
