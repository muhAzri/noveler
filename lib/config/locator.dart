import 'package:get_it/get_it.dart';
import 'package:noveler/config/api_client.dart';
import 'package:noveler/data/services/auth_services.dart';
import 'package:noveler/data/services/bookmark_services.dart';
import 'package:noveler/data/services/discover_services.dart';
import 'package:noveler/data/services/genre_services.dart';
import 'package:noveler/data/services/novel_detail_services.dart';
import 'package:noveler/data/services/profile_services.dart';
import 'package:noveler/data/services/search_novel.services.dart';
import 'package:noveler/feature/app/bloc/cubit/bottom_nav_bar_cubit.dart';
import 'package:noveler/routes/app_router.dart';

class Locator {
  static final getIt = GetIt.instance;

  void setupDepedencyInjection() {
    getIt.registerSingleton<AppRouter>(AppRouter());
    getIt.registerSingleton<ApiClient>(ApiClient());
    getIt.registerSingleton<BottomNavBarCubit>(BottomNavBarCubit());
    getIt.registerSingleton<AuthServices>(AuthServices());
    getIt.registerSingleton<DiscoverServices>(DiscoverServices());
    getIt.registerSingleton<ProfileServices>(ProfileServices());
    getIt.registerSingleton<NovelDetailServices>(NovelDetailServices());
    getIt.registerSingleton<BookmarkServices>(BookmarkServices());
    getIt.registerSingleton<SearchNovelServices>(SearchNovelServices());
    getIt.registerSingleton<GenreServices>(GenreServices());
  }
}
