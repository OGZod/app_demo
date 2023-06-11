
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
