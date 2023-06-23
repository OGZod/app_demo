
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:untitled/values/colors.dart';

import 'chat/chat_screen.dart';
import 'home/home_screen.dart';
import 'how_to/how_to_screen.dart';

Widget buildPage(int index){
  List<Widget> widget = [
    const HomeScreen(),
    const Center(child: Text('Feed')),
    const Center(child: Text('Shops')),
    const ChatScreen(),
    const HowToScreen(),
  ];
  return widget[index];
}

PreferredSizeWidget buildPageAppBar(int appBarIndex, VoidCallback onTap ,BuildContext context){

  List<PreferredSizeWidget> widget = [
     AppBar(
         backgroundColor: white,
        leading:  GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundImage:AssetImage('assets/images/1024.png'),
            ),
          ),
        ),
        elevation: 0,
        bottom: PreferredSize(child: Container(color: grey100,height: 1.h,),
          preferredSize: Size.fromHeight(1.h),),
        title: Padding(
            padding:  EdgeInsets.only(top: 10.h,bottom: 10.h),
            child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 270.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primary50,
                    ),
                    child:  TextFormField(
                        onChanged: (value){},
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: 'Search Menu',
                            hintStyle: TextStyle(fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              child: Iconify(
                                MaterialSymbols.search,
                                color: grey300,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )
                        )
                    ),
                  ),
                ])

        )
    ),
     AppBar(
        leading:  GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundImage:AssetImage('assets/images/1024.png'),
            ),
          ),
        ),
        backgroundColor: white,
        elevation: 0,
        bottom: PreferredSize(child: Container(color: grey100,height: 1.h,),
          preferredSize: Size.fromHeight(1.h),),
        title: Padding(
            padding:  EdgeInsets.only(top: 10.h,bottom: 10.h),
            child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 270.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primary50,
                    ),
                    child:  TextFormField(
                        onChanged: (value){},
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: 'Search Menu',
                            hintStyle: TextStyle(fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              child: Iconify(
                                MaterialSymbols.search,
                                color: grey300,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )
                        )
                    ),
                  ),
                ])

        )
    ),
     AppBar(
        leading:  GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundImage:AssetImage('assets/images/1024.png'),
            ),
          ),
        ),
        backgroundColor: white,
        elevation: 0,
        bottom: PreferredSize(child: Container(color: grey100,height: 1.h,),
          preferredSize: Size.fromHeight(1.h),),
        title: Padding(
            padding:  EdgeInsets.only(top: 10.h,bottom: 10.h),
            child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 270.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primary50,
                    ),
                    child:  TextFormField(
                        onChanged: (value){},
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: 'Search Menu',
                            hintStyle: TextStyle(fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              child: Iconify(
                                MaterialSymbols.search,
                                color: grey300,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )
                        )
                    ),
                  ),
                ])

        )
    ),
     AppBar(
        leading:  GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundImage:AssetImage('assets/images/1024.png'),
            ),
          ),
        ),
        backgroundColor: white,
        elevation: 0,
        bottom: PreferredSize(child: Container(color: grey100,height: 1.h,),
          preferredSize: Size.fromHeight(1.h),),
        title: Padding(
            padding:  EdgeInsets.only(top: 10.h,bottom: 10.h),
            child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 270.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primary50,
                    ),
                    child:  TextFormField(
                        onChanged: (value){},
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: 'Search Menu',
                            hintStyle: TextStyle(fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              child: Iconify(
                                MaterialSymbols.search,
                                color: grey300,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )
                        )
                    ),
                  ),
                ])

        )
    ),
     AppBar(
        leading:  GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundImage:AssetImage('assets/images/1024.png'),
            ),
          ),
        ),
        backgroundColor: white,
        elevation: 0,
        bottom: PreferredSize(child: Container(color: grey100,height: 1.h,),
          preferredSize: Size.fromHeight(1.h),),
        title: Padding(
            padding:  EdgeInsets.only(top: 10.h,bottom: 10.h),
            child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 270.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primary50,
                    ),
                    child:  TextFormField(
                        onChanged: (value){},
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: 'Search Menu',
                            hintStyle: TextStyle(fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              child: Iconify(
                                MaterialSymbols.search,
                                color: grey300,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )
                        )
                    ),
                  ),
                ])

        )
    ),
  ];
  return widget[appBarIndex];
}

class TextWidget extends StatelessWidget {
   const TextWidget({
    super.key, required this.text, required this.color, this.letterSpacing,
    this.fontStyle, required this.fontSize, required this.fontWeight,
    this.maxLines, this.textOverflow
  });
  final String text;
  final Color color;
  final double? letterSpacing;
  final double fontSize;
  final FontStyle? fontStyle;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow ;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
     overflow: textOverflow,
      textAlign: TextAlign.left,
      softWrap: false,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,

      ),
    );
  }
}

class HomeSliderContainer extends StatelessWidget {
  const HomeSliderContainer({
    super.key, required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 325.w,
        height: 160.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
          image:DecorationImage(
              image:AssetImage(image),
              fit: BoxFit.fill
          ),
        )
    );
  }
}

class HomeMenuButton extends StatelessWidget {
  const HomeMenuButton({
    super.key, required this.text, required this.color, required this.textColor,
  });
final String text;
final Color color;
final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 15.w),
      child: TextWidget(text: text, color: textColor,
        fontSize: 14, fontWeight: FontWeight.normal,),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7.w),
          border: Border.all(color: white),
      ),
    );
  }
}
