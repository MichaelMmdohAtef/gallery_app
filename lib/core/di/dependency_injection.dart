import 'package:dio/dio.dart';
import 'package:gallery_app/core/networking/api_service.dart';
import 'package:gallery_app/core/networking/dio_factory.dart';
import 'package:gallery_app/features/home/data/repos/home_repo.dart';
import 'package:gallery_app/features/home/logic/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/logic/data%20source/get_images_local_data.dart';
import 'package:gallery_app/features/home/logic/data%20source/get_images_remote_data.dart';
import 'package:get_it/get_it.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/cubit/login_cubit.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  GetImagesLocalDataSource getImagesLocalDataSource=GetImagesLocalDataSource();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));


  // home
  getIt.registerLazySingleton<GetImagesRemoteDataSource>(() => GetImagesRemoteDataSource(getIt<ApiService>(), dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>(),dio,getImagesLocalDataSource,getIt<GetImagesRemoteDataSource>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));


  
}
