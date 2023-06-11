
import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/global.dart';
import 'package:untitled/screens/onboarding/bloc/onboarding_events.dart';

import '../../values/colors.dart';
import '../../values/constants.dart';
import 'bloc/onboarding_blocs.dart';
import 'bloc/onboarding_states.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
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
        currentIndex = 2;
      }
    });
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Scaffold(body: BlocBuilder<OnboardingBloc, OnboardingStates>(
          builder: (BuildContext context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(16.w, 100.h, 16.w, 16.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<OnboardingBloc>(context)
                      .add(OnboardingEvents());
                },
                children: [
                  onboardingBuildColumn(
                      1,
                      'assets/images/connect.png',
                      'Connect',
                      'Connect with Cake suppliers to get their services at the comfort of your home,',
                      false),
                  onboardingBuildColumn(
                      2,
                      'assets/images/learn_how.png',
                      'Learn How',
                      'Learn how to make your favorite your pastry from experts and be in demand',
                      false),
                  onboardingBuildColumn(
                      3,
                      'assets/images/make_order.png',
                      'Make Order',
                      'Order cakes for your events and get it delivered to you.',
                      true),
                ],
              ),
              Positioned(
                bottom: 0,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: state.page,
                  decorator: DotsDecorator(
                    color: grey100,
                    size: const Size.square(8),
                    activeColor: primary300,
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    activeSize: const Size(18.0, 8.0),
                  ),
                ),
              )
            ],
          ),
        );
      })),
    );
  }

  Column onboardingBuildColumn(
    int index,
    String imagePath,
    String text1,
    String text2,
    bool last,
  ) {
    return Column(
      children: [
        Image(
          height: 250.h,
          width: 250.w,
          image: AssetImage(imagePath),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          text1,
          style:TextStyle(

            fontWeight: FontWeight.bold,
            fontSize: 32.sp,
            color: black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 22.w, right: 22.w),
          child: Text(
            text2,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.sp,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        const SizedBox(
          height: 120,
        ),
        SizedBox(
          width: 375.w,
          height: 40.h,
          child: last
              ? GestureDetector(
                  onTap: () {
                    Global.storageService.setBool(
                        AppConstants.storageDeviceOpenFirstTime, false);

                    Navigator.of(context).pushNamedAndRemoveUntil(
                      "/signUp"  ,(route)=> false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: primary300,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Global.storageService.setBool(AppConstants.storageDeviceOpenFirstTime, true);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/signUp"  ,(route)=> false);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: black,
                              fontWeight: FontWeight.bold),
                        )),
                    GestureDetector(
                      onTap: () {
                        if(index<3) {
                          pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeIn);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: primary300,
                            borderRadius: BorderRadius.circular(10.0)),
                        width: 98.w,
                        height: 40.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              CupertinoIcons.arrow_right,
                              color: white,
                              size: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
