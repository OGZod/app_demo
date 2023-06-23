import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:untitled/screens/login/bloc/sign_in_blocs.dart';
import 'package:untitled/screens/login/bloc/sign_in_events.dart';
import 'package:untitled/screens/login/sign_in_controller.dart';

import '../../values/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool password = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 50.h,horizontal: 16.w),
          child: Align(
            child: Column(
              children: [
                Iconify(La.sign_in_alt, color: primary900,size: 75,),
                SizedBox(height: 5.h,),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: primary900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50.h,),
                buildTextFormField(
                    false,
                  MaterialSymbols.mark_email_unread,
                  'email',
                  'Email',
                    (value){
                    context.read<SignInBlocs>().add(EmailEvent(value));
                    }
                ),
                SizedBox(height: 25.h,),
                buildTextFormField(
                    password,
                  Mdi.forgot_password,
                  'password',
                  'Password',
                        (value){
                      context.read<SignInBlocs>().add(PasswordEvent(value));
                    }
                ),
                SizedBox(height: 15.h,),
                Align(
                  alignment: Alignment.bottomRight,
                    child: buildTextButton('Forgot Password?',(){})),
                SizedBox(height: 50.h,),
                GestureDetector(
                  onTap: (){
                    SignInController(context: context).handleSignIn();
                  },
                  child: Container(
                    width: 345.w,
                    height: 50.h,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [primary800,primary300],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text('or',style: TextStyle(fontSize:16.sp),),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:  (){
                      },
                      child: Container(
                        width: 150.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            image:  DecorationImage(
                                image: AssetImage(
                                    'assets/images/google logo.jpg'),
                            ),
                            borderRadius: BorderRadius.circular(10.0)),

                      ),
                    ),
                    GestureDetector(
                      onTap:  (){
                      },
                      child: Container(
                        width: 100.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/Facebook-logo.png')),
                            borderRadius: BorderRadius.circular(50.0)),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h,),
                Container(
                    height: 1.0,
                    decoration: BoxDecoration(
                        color: primary900,
                        boxShadow: [
                          BoxShadow(
                              color: primary800,
                              blurRadius: 8,
                              offset: const Offset(0, 4)
                          )
                        ]
                    )
                ),
                SizedBox(height: 25.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: primary900,
                        fontWeight: FontWeight.w300,),),
                    buildTextButton(
                      'Sign-up',
                          (){
                        Navigator.of(context).pushNamed(
                            "/signUp"  );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
}

  TextButton buildTextButton(String text, VoidCallback onPressed) {
    return TextButton(
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 16,
                        color: primary300,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )
              );
  }
  SizedBox buildTextFormField(
      bool obscureText,
      String prefixIcon,
      String type,
      String labelText,
      void Function(String)? function
      ) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        onChanged: (value)=>function!(value),
        autocorrect: false,
        obscureText: obscureText,
        enableSuggestions: type == 'password' ? false : true,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(fontSize: 14.sp, color: grey300,),
          filled: true,
          fillColor: white,
          labelText: labelText,
          labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
            child: Iconify(prefixIcon,color: grey400,),
          ),
          suffixIcon: type == 'password'?GestureDetector(
            onTap: (){
              setState(() {
                  password = !password;
              });
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
            child: password?Iconify(Mdi.eye,color: grey400,)
                :Iconify(Mdi.eye_off,color: grey400,)
            ),
          ):null,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: grey200,
              ),
              gapPadding: 16.0,
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        ),
      ),
    );
  }
}
