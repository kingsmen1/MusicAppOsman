import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:music_artist_app_osman/blocs/internet/internet_bloc.dart';
import 'package:music_artist_app_osman/repository/artist_repo.dart';
import 'package:music_artist_app_osman/screens/splash/splashScreen.dart';

import 'blocs/artist/artisbloc_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                InternetBloc(InternetConnectionChecker())..add(loadInternet())),
        BlocProvider(create: (_) => ArtistBloc(artistrepo: ArtistRepo()))
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
