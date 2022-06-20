import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/artist.dart';
import '../screens/details/detailsScreen.dart';
import '../utils/utils.dart';

class ArtistCard extends StatelessWidget {
  final Artist artist;

  const ArtistCard({
    Key? key,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      artist: artist,
                    )));
      },
      child: Container(
        height: 190.03.h,
        width: 150.88.w,
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 10,
              shadowColor: Colors.black,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
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
      ),
    );
  }
}
