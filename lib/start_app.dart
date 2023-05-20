import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/screens/onboarding/get_started.dart';
void main(){
  runApp(const AppDemo());
}
class AppDemo extends StatelessWidget {
  const AppDemo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: GetStarted(),
        );
      },
    );
  }
}
