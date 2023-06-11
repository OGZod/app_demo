import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:untitled/routes/routes.dart';
import 'package:untitled/screens/home/bloc/home_screen_blocs.dart';
import 'package:untitled/screens/home/bloc/home_screen_eventss.dart';
import 'package:untitled/screens/home/bloc/home_screen_states.dart';
import 'package:untitled/screens/login/sign_in.dart';
import 'package:untitled/screens/profile/bloc/profile_bloc.dart';
import 'package:untitled/screens/profile/bloc/profile_states.dart';
import 'package:untitled/screens/profile/profile_screen.dart';
import 'package:untitled/values/colors.dart';

import '../screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
        pageController.animateToPage(
          currentIndex,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        currentIndex= -1;
      }
    });
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer:  Drawer(
            backgroundColor: white,
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    onDetailsPressed: () {},
                    currentAccountPicture: const CircleAvatar(
                      foregroundImage: AssetImage('assets/images/1024.png'),
                    ),
                    accountName: const Text('Ramish'),
                    accountEmail: const Text("wil850@yahoo.com"),
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
      backgroundColor: white,
      appBar: AppBar(
         leading:  GestureDetector(
           onTap: (){
             scaffoldKey.currentState?.openDrawer();
           },
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
      body: BlocBuilder<HomeScreenBlocs,HomeScreenStates>(
        builder:(context,state){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                       TextWidget(
                          text: 'Hello',
                          color: grey100, fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: 10.w,),
                      TextWidget(
                          text: 'Zod',
                          color: grey300,
                          letterSpacing: 5,
                          fontStyle: FontStyle.italic, fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                    ],
                  ),
                ),

                SliverPadding(padding: EdgeInsets.only(top: 10.h)),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        width: 325.w,
                        height: 160.h,
                        child: PageView(

                          controller: pageController,
                          onPageChanged: (value) {
                            BlocProvider.of<HomeScreenBlocs>(context)
                                .add(HomeScreenDots(value));
                          },
                          children: [
                            HomeSliderContainer(
                              image: 'assets/images/home_connect.png',
                            ),
                            HomeSliderContainer(
                              image: 'assets/images/home_trade.png',
                            ),
                            HomeSliderContainer(
                              image: 'assets/images/home_learn.png',
                            ),
                          ],
                        ),

                      ),
                      DotsIndicator(
                        dotsCount: 3,
                        position: state.index,
                        decorator: DotsDecorator(
                          color: grey100,
                          size: const Size.square(5),
                          activeColor: primary300,
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          activeSize: const Size(15.0, 5.0),
                        ),
                      ),
                    ],
                  ),
                ),

                SliverPadding(padding: EdgeInsets.only(top: 20.h)),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:CrossAxisAlignment.end ,
                          children: [
                            TextWidget(
                              text: "Today's MENU" ,
                              color: black, fontSize: 18.sp,
                              fontWeight: FontWeight.bold,),
                            GestureDetector(
                                child: TextWidget(
                                  text: 'See all',
                                  color: grey200,
                                  fontSize: 16.sp, fontWeight:
                                FontWeight.bold,),
                            ),
                          ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          HomeMenuButton(
                            text: 'All',
                            color: primary300,
                            textColor: white,),
                          HomeMenuButton(
                            text: 'Trending',
                            color: white,
                            textColor: grey200,),
                          HomeMenuButton(
                            text: 'Recent', color: white,
                            textColor: grey200,),
                        ],
                      )
                    ],
                  ),
                ),

                SliverPadding(
                    padding: EdgeInsets.symmetric(
                        vertical: 18.h,
                        horizontal:0.w
                    ),
                  sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        //childCount: 10,
                              (context, index) {
                                return GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    padding: EdgeInsets.all(12.w),
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         TextWidget(
                                             text: 'Parfait',
                                             color: white,
                                             fontSize: 12.sp,
                                             maxLines: 1,
                                             textOverflow: TextOverflow.fade,
                                             fontWeight: FontWeight.bold),
                                         TextWidget(
                                             text: 'Dessert',
                                             color: grey50,
                                             fontSize: 10.sp,
                                             fontWeight: FontWeight.normal),

                                     ],),
                                    decoration: BoxDecoration(
                                      color: primary100,
                                      borderRadius: BorderRadius.circular(10.w),
                                      image: DecorationImage(
                                          image:AssetImage(
                                              'assets/images/img_1.png'),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                  ),
                                );
                              }),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.6
                      ),
                  ),

                ),

              ],
            ),
          );
        },
      ),
    );
  }
}


