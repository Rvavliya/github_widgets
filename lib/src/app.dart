import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery/src/provider/cubit/connection_cubit.dart';
import 'package:flutter_gallery/src/provider/cubit/theme_cubit.dart';
import 'package:flutter_gallery/src/provider/home/bloc/home_bloc.dart';
import 'package:flutter_gallery/src/utils/database/hive/hive.dart';
import 'package:flutter_gallery/src/view/authentication/login.dart';
import 'package:flutter_gallery/src/view/home/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Disable landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    // FirebaseAnalyticsObserver observer =
    //     FirebaseAnalyticsObserver(analytics: analytics);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(const HomeEvent.started()),
        ),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => ConnectivityCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: const Size(360, 690),
            child: MaterialApp(
              title: 'Flutter Gallary',
              theme: state,
              home: _screenhandle(),
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }

  Widget _screenhandle() {
    if (!HiveUtils.isContainKey(HiveKeys.loginEmail)) {
      return const LoginPage();
    } else {
      return const HomePage();
    }
  }
}
