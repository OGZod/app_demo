import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/screens/create_account/bloc/signup_events.dart';
import 'package:untitled/screens/create_account/signup_controller.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/icon_park_solid.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

import '../../values/colors.dart';
import 'bloc/signup_blocs.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool password = true;
  bool confirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Iconify(
                Mdi.register,
                color: primary900,
                size: 50,
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: primary900,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              buildTextFormField(
                  IconParkSolid.edit_name, 'name', false, 'Username', false,
                      (value){
                    context.read<SignUpBlocs>().add(UserNameEvent(value));
                  }
              ),
              SizedBox(
                height: 20.h,
              ),
              buildTextFormField(MaterialSymbols.mark_email_unread, 'email',
                  false, 'Email', false,  (value){
                    context.read<SignUpBlocs>().add(EmailEvent(value));
                  }),
              SizedBox(
                height: 20.h,
              ),
              buildTextFormField(
                  Mdi.forgot_password, 'password', false, 'Password', password,
                      (value){
                    context.read<SignUpBlocs>().add(PasswordEvent(value));
                  }
              ),
              SizedBox(
                height: 20.h,
              ),
              buildTextFormField(Mdi.password_check, 'confirmPassword', false,
                  'Confirm Password', confirmPassword,(value){
                    context.read<SignUpBlocs>().add(ConfirmPasswordEvent(value));
                  }),
              SizedBox(
                height: 25.h,
              ),
              Text(
                '*By creating an account, you have agreed to our terms and conditions.*',
                style: TextStyle(fontStyle: FontStyle.italic, color: primary900),
              ),
              SizedBox(
                height: 25.h,
              ),
              GestureDetector(
                onTap:  (){
                  SignUpController(context: context).handleEmailRegister();
                  },
                child: Container(
                  width: 345.w,
                  height: 50.h,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [primary800, primary300],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.sp, color: white),
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
              SizedBox(
                height: 25.h,
              ),
              Container(
                  height: 1.0,
                  decoration: BoxDecoration(color: primary900, boxShadow: [
                    BoxShadow(
                        color: primary800,
                        blurRadius: 8,
                        offset: const Offset(0, 4))
                  ])),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      color: primary900,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/signIn");
                      },
                      child: Text(
                        'Sign-in',
                        style: TextStyle(
                            fontSize: 16,
                            color: primary300,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildTextFormField(
      String prefixIcon,
      String type,
      bool autoCorrect,
      String labelText,
      bool obscureText,
      void Function(String)? function
  ) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        onChanged: (value) => function!(value),
        autocorrect: autoCorrect,
        obscureText: obscureText,
        enableSuggestions:
            type == 'password' || type == 'confirmPassword' ? false : true,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(
            fontSize: 14.sp,
            color: grey300,
          ),
          filled: true,
          fillColor: white,
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Iconify(
              prefixIcon,
              color: grey400,
            ),
          ),
          suffixIcon: type == 'password' || type == 'confirmPassword'
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      type == 'password'
                          ? password = !password
                          : confirmPassword = !confirmPassword;
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: obscureText == confirmPassword &&
                              type == 'confirmPassword'
                          ? Iconify(
                              confirmPassword ? Mdi.eye : Mdi.eye_off,
                              color: grey400,
                            )
                          : Iconify(
                              password ? Mdi.eye : Mdi.eye_off,
                              color: grey400,
                            )),
                )
              : null,
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
