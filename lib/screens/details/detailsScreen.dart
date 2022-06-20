import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:music_artist_app_osman/screens/details/components/body.dart';

import '../../models/artist.dart';

class DetailScreen extends StatelessWidget {
  final Artist artist;
  const DetailScreen({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 127, 127, 129),
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
  }
}
