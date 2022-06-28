import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_artist_app_osman/screens/noInternet/no_internet.dart';
import 'package:music_artist_app_osman/utils/utils.dart';
import 'package:music_artist_app_osman/widgets/SearchBar.dart';

import '../../blocs/artist/artisbloc_bloc.dart';
import '../../blocs/internet/internet_bloc.dart';
import '../../widgets/artist_card.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetLoading) {
          return loading();
        }
        if (state is disconnected) {
          return const NoInternet();
        }
        if (state is connected) {
          return BlocBuilder<ArtistBloc, ArtisBlocState>(
              builder: (context, state) {
            if (state is ArtistLoading) {
              return Scaffold(
                body: loading(),
              );
            }
            if (state is ArtistLoaded) {
              return SafeArea(
                child: Scaffold(
                  bottomNavigationBar: const CustomNavigationBar(),
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        const SearchBox(),
                        Sheight(10),
                        Text(
                          'Trending Artist',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Sheight(10),
                        Expanded(
                          child: GridView.builder(
                            itemCount: state.artistList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio:
                                        (ScreenUtil().screenWidth /
                                                ScreenUtil().screenHeight) /
                                            0.55,
                                    mainAxisSpacing: 10.h,
                                    crossAxisSpacing: 15.w,
                                    crossAxisCount: 2),
                            itemBuilder: ((context, index) {
                              var artist = state.artistList[index];
                              return ArtistCard(
                                artist: artist,
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(body: error());
            }
          });
        } else {
          return Scaffold(body: error());
        }
      },
    );
  }
}
