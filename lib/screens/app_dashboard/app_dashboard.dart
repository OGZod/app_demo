import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:untitled/screens/app_dashboard/bloc/app_blocs.dart';
import 'package:untitled/screens/app_dashboard/bloc/app_events.dart';
import 'package:untitled/screens/app_dashboard/bloc/app_state.dart';
import 'package:untitled/values/constants.dart';

import '../../routes/names.dart';
import '../../values/colors.dart';
import '../home/home_controller.dart';
import '../screen_widgets.dart';

class AppDashboard extends StatefulWidget {
  const AppDashboard({Key? key}) : super(key: key);

  @override
  State<AppDashboard> createState() => _AppDashboardState();
}

class _AppDashboardState extends State<AppDashboard> {

  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(context: context);
    homeController.init();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs,AppStates>(
      builder: (BuildContext context, state) {
      return SafeArea(
        top: false,
        child: Scaffold(
          key:  scaffoldKey,
          backgroundColor: white,
          drawer:  Drawer(
            backgroundColor: white,
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  onDetailsPressed: () {},
                  currentAccountPicture:  Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                          image: DecorationImage(image: NetworkImage(
                              'http://192.168.201.167:8000/uploads/images/default.png'
                          ),
                              fit: BoxFit.fill
                          )
                      )
                  ),
                  accountName:  Text('${homeController.userProfile.name}'),
                  accountEmail: Text("${homeController.userProfile.email}"),
                  decoration: BoxDecoration(color: primary700),
                ),
                SizedBox(height: 20.h,),
                ListTile(
                  iconColor: black,
                  leading: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          color: primary300,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(Icons.person,)),
                  title: TextWidget(
                      text: 'Profile',
                      color: black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.profile);
                  },

                ),
                SizedBox(height: 20.h,),
                ListTile(
                  iconColor: black,
                  leading: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          color: primary300,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(Icons.settings)),
                  title: TextWidget(
                      text: 'Settings',
                      color: black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.settings);
                  },

                ),
                SizedBox(height: 20.h,),
                Divider(
                  color: grey50,
                  thickness: 1.0,),
                Container(
                    width: 200.w,
                    height: 250.h,
                    alignment: Alignment.bottomCenter,
                    child: TextWidget(text: 'BAYANGI MAN', color: grey50, fontSize:12, fontWeight: FontWeight.bold)
                )

              ],

            ),
          ),
          appBar: buildPageAppBar(state.appBarIndex,  (){
            scaffoldKey.currentState?.openDrawer();
          },context),
          body: buildPage(state.index),
          bottomNavigationBar: Container(
            width: 392.w,
            height: 60.h,
            decoration: BoxDecoration(
             border: Border(top: BorderSide(color: primary50)),
              boxShadow: [BoxShadow(
                color: primary50,
                spreadRadius: 1,
                blurRadius: 1

              )],
            ),
            child: BottomNavigationBar(
              backgroundColor: white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: primary600,
              unselectedItemColor: grey300,
              selectedFontSize: 10.sp,
              unselectedFontSize: 10.sp,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

              currentIndex: state.index,
              onTap: (value){
                setState(() {
                  context.read<AppBlocs>().add(TriggerAppEvent(value));
                });
              },
              elevation: 0,
                items:  [
              buildBottomNavigationBarItem(
                'Home',
                MaterialSymbols.home,
                MaterialSymbols.home,
              ),
              buildBottomNavigationBarItem(
                'Feed',
                MaterialSymbols.feed,
                MaterialSymbols.feed,
              ),
              buildBottomNavigationBarItem(
                'Shops',
                Mdi.shopping_cart,
                Mdi.shopping_cart,
              ),
              buildBottomNavigationBarItem(
                'Chat',
                MaterialSymbols.chat,
                MaterialSymbols.chat,
              ),
              buildBottomNavigationBarItem(
                'How to',
                Mdi.file_question,
                Mdi.file_question,
              ),

                ]
            ),
          ),
        ),
      );
  });
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String label, String icon, String activeIcon) {
    return BottomNavigationBarItem(
            icon:Iconify(icon,color: grey300,size: 20.sp,),
          label: label,
          activeIcon: Iconify(activeIcon,color: primary600,size:24.sp ,),

        );
  }
}
