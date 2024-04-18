import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/routing/routes.dart';
import 'package:gallery_app/features/home/data/repos/home_repo.dart';
import 'package:gallery_app/features/home/logic/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/ui/home_screen.dart';
import 'package:gallery_app/features/login/data/repos/login_repo.dart';
import 'package:gallery_app/features/login/logic/cubit/login_cubit.dart';
import 'package:gallery_app/features/login/ui/login_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt<HomeRepo>()),
            child: const HomeScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt<LoginRepo>()),
            child: const LoginScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
