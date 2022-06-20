import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRoundedContainer extends StatelessWidget {
  TopRoundedContainer({
    required this.collor,
    required this.child,
  });

  final Color collor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      //margin: EdgeInsets.only(top: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
          color: collor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: child,
    );
  }
}
