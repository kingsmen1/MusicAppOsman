import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:music_artist_app_osman/screens/details/components/body.dart';
import 'package:music_artist_app_osman/screens/noInternet/no_internet.dart';

import '../../blocs/internet/internet_bloc.dart';
import '../../models/artist.dart';

class DetailScreen extends StatelessWidget {
  final Artist artist;
  const DetailScreen({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
      if (state is connected) {
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 127, 127, 129),
            appBar: AppBar(
              title: Text(
                artist.name,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
            ),
            extendBodyBehindAppBar: true,
            body: Body(artist: artist));
      } else {
        return const NoInternet();
      }
    });
  }
}
