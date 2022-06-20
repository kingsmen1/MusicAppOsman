import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:music_artist_app_osman/utils/utils.dart';
import 'package:music_artist_app_osman/widgets/top_rounded_container.dart';

import '../../../models/artist.dart';

class Body extends StatefulWidget {
  final Artist artist;
  const Body({Key? key, required this.artist}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isConnectted = false;

  @override
  void initState() {
    super.initState();

    _internetCheck(InternetConnectionChecker());
  }

  void _internetCheck(InternetConnectionChecker internetConnectionChecker) {
    print('function played');
    internetConnectionChecker.onStatusChange.listen((event) {
      final isConnected = event == InternetConnectionStatus.connected;
      setState(() {
        isConnectted = isConnected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 500.h,
              child: Image.network(
                widget.artist.picture,
                fit: BoxFit.cover,
              )),
          //Sheight(10),
          TopRoundedContainer(
            collor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      children: [
                        Text('Rated :',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 18.sp)),
                        const Spacer(),
                        RatingBar.builder(
                          itemSize: 24.h,
                          initialRating: widget.artist.rating.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20.h,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Text('No Of ServiceCompleted :',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 18.sp)),
                        const Spacer(),
                        Text('${widget.artist.noOfServiceCompleted}',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 18.sp)),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  SizedBox(
                    width: double.infinity,
                    child: Text("Biography",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 18.sp)),
                  ),
                  Sheight(10),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.artist.bio,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
