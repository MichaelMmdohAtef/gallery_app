import 'package:dio/dio.dart';
import 'package:gallery_app/core/networking/api_error_handler.dart';
import 'package:gallery_app/core/networking/api_result.dart';
import 'package:gallery_app/core/networking/api_service.dart';
import 'package:gallery_app/features/login/data/models/login_request_body.dart';
import 'package:gallery_app/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody.toJson());
      return ApiResult.success(response);
    } on DioException catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
