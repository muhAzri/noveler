import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noveler/data/form_model/search_form_model.dart';
import 'package:noveler/feature/app/presentation/screens/main/main_screen.dart';
import 'package:noveler/feature/app/presentation/screens/splash/splash_screen.dart';
import 'package:noveler/feature/auth/bloc/auth_bloc.dart';
import 'package:noveler/feature/auth/presentation/screens/login_screen.dart';
import 'package:noveler/feature/auth/presentation/screens/register_screen.dart';
import 'package:noveler/feature/novel/bloc/detail_novel/detail_novel_bloc.dart';
import 'package:noveler/feature/novel/presentation/screens/novel_detail_screen.dart';
import 'package:noveler/feature/profile/presentation/screens/about_us_screen.dart';
import 'package:noveler/feature/profile/presentation/screens/dmca_screen.dart';
import 'package:noveler/feature/profile/presentation/screens/privacy_and_policy_dart.dart';
import 'package:noveler/feature/search/bloc/genre/genre_bloc.dart';
import 'package:noveler/feature/search/bloc/search/search_novel_bloc.dart';
import 'package:noveler/feature/search/presentation/screens/filter_screen.dart';
import 'package:noveler/feature/search/presentation/screens/search_novel_screen.dart';
import 'package:noveler/routes/app_routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return Builder(
        builder: (BuildContext context) {
          switch (settings.name) {
            case AppRoutes.splash:
              return const SplashScreen();

            case AppRoutes.login:
              return BlocProvider(
                create: (context) => AuthBloc(),
                child: const LoginScreen(),
              );

            case AppRoutes.register:
              return BlocProvider(
                create: (context) => AuthBloc(),
                child: const RegisterScreen(),
              );

            case AppRoutes.main:
              return const MainScreen();

            case AppRoutes.privacyAndPolicy:
              return const PrivacyAndPolicy();

            case AppRoutes.dmca:
              return const DMCAScreen();

            case AppRoutes.aboutUs:
              return const AboutUsScreen();

            case AppRoutes.novelDetail:
              final Map<String, dynamic> arguments =
                  settings.arguments as Map<String, dynamic>;
              final String novelID = arguments['novelID'];

              return BlocProvider(
                create: (context) => DetailNovelBloc(),
                child: NovelDetailScreen(
                  novelID: novelID,
                ),
              );

            case AppRoutes.searchNovel:
              return BlocProvider(
                create: (context) => SearchNovelBloc(),
                child: const SearchNovelScreen(),
              );

            case AppRoutes.filterNovel:
              final Map<String, dynamic> arguments =
                  settings.arguments as Map<String, dynamic>;
              final SearchFormModel params = arguments['params'];
              final Function(SearchFormModel) setStateParams =
                  arguments['setStateParams'];
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => SearchNovelBloc(),
                  ),
                  BlocProvider(
                    create: (context) => GenreBloc(),
                  ),
                ],
                child: FilterScreen(
                  params: params,
                  setStateParams: setStateParams,
                ),
              );

            default:
              return const Scaffold(
                body: Center(
                  child: Text(
                    'Check Named Route',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              );
          }
        },
      );
    });
  }
}
