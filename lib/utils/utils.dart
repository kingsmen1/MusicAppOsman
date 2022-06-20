import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox Sheight(int height) {
  return SizedBox(
    height: height.h,
  );
}

SizedBox Swidth(int width) {
  return SizedBox(
    width: width.h,
  );
}

Center loading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Center error() {
  return const Center(
    child: Text('Something Went Wrong'),
  );
}

Center noInternet() {
  return const Center(
    child: Text(
      'No Internet Connection',
      textAlign: TextAlign.center,
      textScaleFactor: 2,
    ),
  );
}
