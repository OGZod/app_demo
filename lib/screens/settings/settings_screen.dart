import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mi.dart';
import 'package:untitled/global.dart';
import 'package:untitled/screens/settings/bloc/settings_blocs.dart';
import 'package:untitled/screens/settings/bloc/settings_states.dart';
import 'package:untitled/values/constants.dart';

import '../../routes/names.dart';
import '../../values/colors.dart';
import '../screen_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:  AppBar(
        foregroundColor: black,
        backgroundColor: white,
        elevation: 0,
        title: TextWidget(text: 'Settings',
                color: black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
        centerTitle: true,
        bottom: PreferredSize(child: Container(color: grey50,height: 1.h,),
          preferredSize: Size.fromHeight(1.h),),
      ),
      body: BlocBuilder<SettingsBlocs,SettingsStates>(builder: (context,state){
        return Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               GestureDetector(
                 onTap: (){
                   showDialog(
                     context: context,
                     builder: (context) => AlertDialog(
                       title: TextWidget(
                           text: 'Confirm Logout',
                           color: black,
                           fontSize: 16.sp,
                           fontWeight: FontWeight.normal),
                       content: TextWidget(
                           text: 'Are you sure you want to logout?',
                           color: Colors.black,
                           fontSize: 12.sp,
                           fontWeight: FontWeight.w300),
                       actions: [
                         TextButton(
                             onPressed: (){Navigator.pop(context);},
                             child: Text('No')),
                         TextButton(onPressed: (){
                           Global.storageService.remove(AppConstants.storageUserTokenKey);
                           Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.signIn,(route)=>false);
                                },
                             child: Text('Yes')),
                       ],
                     ),
                   );
                 },
                   child: Container(
                     padding: EdgeInsets.all(10),
                     height: 48.h,
                     decoration: BoxDecoration(
                       border: Border.all(color: primary100),
                       borderRadius: BorderRadius.circular(25),
                       boxShadow: [
                         BoxShadow(
                          color: white,
                          blurRadius: 8,
                           spreadRadius: 4,
                           blurStyle: BlurStyle.inner,
                           offset: Offset(5, 5)
                         )
                       ]
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Iconify(Mi.log_out,color: primary900,size: 30,),
                            SizedBox(width: 15.w,),
                            TextWidget(
                                text: 'Log Out',
                                color: primary900,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                            ),
                          ],
                      ),
                   ),
                 ),
            ],
          ),
        );
      }),
    );
  }
}
