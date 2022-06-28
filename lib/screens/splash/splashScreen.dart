import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_artist_app_osman/screens/home/HomeScreen.dart';

import '../../blocs/artist/artisbloc_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //context.read<ArtistBloc>().add(LoadArtist());
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    });
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: ScreenUtil().screenHeight,
          width: double.infinity,
          child: Image.asset(
            'assets/images/musicSplash.jpg',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
