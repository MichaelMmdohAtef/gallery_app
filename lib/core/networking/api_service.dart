import 'package:dio/dio.dart';
import 'package:gallery_app/core/networking/api_constants.dart';
import 'package:gallery_app/features/home/data/models/get_gallery_model.dart';
import 'package:gallery_app/features/home/data/models/upload_image_response.dart';
import 'package:gallery_app/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() Map<String,dynamic> loginRequestBody,
  );

  @POST(ApiConstants.uploadImages)
  Future<UploadImageResponse> uploadImage(
    @Body() FormData formData,
  );

  @GET(ApiConstants.getImages)
  Future<GetGalleryModel> getImages();
}
