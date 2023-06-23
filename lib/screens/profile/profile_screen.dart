import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mi.dart';
import 'package:untitled/screens/screen_widgets.dart';

import '../../values/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          foregroundColor: black,
          backgroundColor: white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(text: 'Profile',
                  color: black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
              Iconify(Mi.options_vertical)
            ],
          ),
          bottom: PreferredSize(child: Container(color: grey50,height: 1.h,),
            preferredSize: Size.fromHeight(1.h),),

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: grey50,
                    image: DecorationImage(image: AssetImage('assets/images/1024.png')),
                    borderRadius: BorderRadius.circular(25.w)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
