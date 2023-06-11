import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/colors.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary900,
      body: Stack(
        children: [
          Center(
            child: Image.asset('assets/images/loading_logo.png',
              height: 200.h,width: 200.w,),
          ),
          Positioned(
            left: 165.w,
            right: 165.w,
            bottom: 100.h,
              child: CircularProgressIndicator(color: primary100,))
    ]),
    );
  }
}
