import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../colors.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Scaffold(
        body: Container(
          margin:  EdgeInsets.fromLTRB(16.w,50.h,16.w,16.h),
          width: 375.w,
          child: Stack(
            children: [
              PageView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 345.w,
                        height: 345.w,
                        child: const Text('Image'),
                      ),
                  Container(
                    child: Text(
                      'Connect',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 32.sp,
                        color: black,
                      ),
                    ),
                  ),
                      Container(
                        width: 375.w,
                        padding: EdgeInsets.only(left: 22.w,right: 22.w),
                        child: Text(
                      'Connect with Cake suppliers to get their services at the comfort of your home',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                      Container(
                        width: 375.w,
                        
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
