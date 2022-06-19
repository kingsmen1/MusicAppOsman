import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_artist_app_osman/models/artist.dart';
import 'package:music_artist_app_osman/utils/utils.dart';
import 'package:music_artist_app_osman/widgets/SearchBar.dart';

import '../blocs/bloc/artisbloc_bloc.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomNavigationBar(),
        body: BlocBuilder<ArtistBloc, ArtisBlocState>(
          builder: (context, state) {
            if (state is ArtistLoading) {
              return loading();
            }
            if (state is ArtistLoaded) {
              return Padding(
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (ScreenUtil().screenWidth /
                                    ScreenUtil().screenHeight) /
                                0.55,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 15.w,
                            crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          var artist = state.artistList[index];
                          return ArtistCard(artist);
                        }),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return error();
            }
          },
        ),
      ),
    );
  }

  ArtistCard(Artist artist) {
    return Container(
      height: 190.03.h,
      width: 150.88.w,
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 10,
            //color: Colors.red,
            shadowColor: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              height: 144.85.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  artist.picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Sheight(5),
          Flexible(
            flex: 1,
            child: Text(artist.name,
                style: GoogleFonts.khula(
                    fontWeight: FontWeight.w700, fontSize: 16.sp)),
          ),
          Flexible(
              flex: 1,
              child: Text(
                'Trending #${artist.id}',
                style: const TextStyle(color: Colors.blueAccent),
              ))
        ],
      ),
    );
  }
}
