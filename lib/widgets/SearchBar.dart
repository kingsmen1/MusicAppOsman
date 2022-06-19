import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBox extends StatelessWidget {
  const SearchBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.w),
      // height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xFF979797).withOpacity(0.50),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'Search',
            prefixIcon: Builder(builder: (context) {
              return const Icon(Icons.search);
            }),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h)),
      ),
    );
  }
}
