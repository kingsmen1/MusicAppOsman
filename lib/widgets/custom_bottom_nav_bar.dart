import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.50)),
            ]),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                    size: 30.h,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Heart Icon.svg',
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Chat bubble Icon.svg',
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/User Icon.svg',
                    color: Colors.black,
                  )),
            ],
          ),
        ));
  }
}
