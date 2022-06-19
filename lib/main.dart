import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_artist_app_osman/blocs/bloc/artisbloc_bloc.dart';
import 'package:music_artist_app_osman/repository/artist_repo.dart';
import 'package:music_artist_app_osman/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                ArtistBloc(artistrepo: ArtistRepo())..add(LoadArtist()))
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
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
