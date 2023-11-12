import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/feature/app/bloc/credit/credit_cubit.dart';
import 'package:noveler/feature/app/bloc/readed_chapter_cubit/readed_chapter_cubit.dart';
import 'package:noveler/routes/app_router.dart';

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CreditCubit(),
            ),
            BlocProvider(
              create: (context) => ReadedChapterCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: !kDebugMode,
            theme: ThemeData(
              useMaterial3: true,
            ),
            navigatorKey: navigatorKey,
            onGenerateRoute: GetIt.instance<AppRouter>().onGenerateRoute,
          ),
        );
      },
    );
  }
}
