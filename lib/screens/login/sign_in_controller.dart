


import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled/entities/user.dart';
import 'package:untitled/global.dart';
import 'package:untitled/screens/login/bloc/sign_in_blocs.dart';
import 'package:untitled/values/colors.dart';
import 'package:untitled/values/constants.dart';

import '../../apis/user_api.dart';
import '../screen_widgets.dart';

class SignInController{

  final BuildContext context;

  const SignInController({
    required this.context
});

  Future<void> handleSignIn() async {
    final state = context.read<SignInBlocs>().state;//or use BlocProvider.of<SignInBlocs>(context).state
    String email = state.email;
    String password = state.password;

    if(email.isEmpty){
      animatedSnackBar(
          "Email cannot be empty" ,
          AnimatedSnackBarType.info,).show(context);
    }
    if (password.isEmpty){
      animatedSnackBar(
          "Password cannot be empty" ,
          AnimatedSnackBarType.info).show(context);

    }

    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      if(credential.user==null){
        print('user does not exist');
        animatedSnackBar(
            'Account does not exist',
            AnimatedSnackBarType.info).show(context);
      }
      if(!credential.user!.emailVerified){
        print('user has not verified email');
        animatedSnackBar(
            'Please verify your email first...',
            AnimatedSnackBarType.info).show(context);
         var snackBar = SnackBar(
           backgroundColor:red300 ,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)
              )
          ),
          duration: Duration(seconds: 20),
          content: Text("Haven't received verification message yet?"),
          action: SnackBarAction(
            textColor: grey900,
            backgroundColor: green50,
              label: 'Resend',
              onPressed: () async {
                await credential.user?.sendEmailVerification();
              }),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      var user = credential.user;
      if(user!=null && credential.user?.emailVerified == true){
        String? displayName = user.displayName;
        String? email = user.email;
        String? photoUrl = user.photoURL;
        String? id = user.uid;
        print('user email is ${email}');
        print('photoUrl is ${photoUrl}');

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.type = 1;//user is using email to login
        loginRequestEntity.open_id = id;//user is using email to login
        loginRequestEntity.name = displayName;//user is using email to login
        loginRequestEntity.email = email;//user is using email to login

        print('user exist and is verified');
        asyncPostAllData(loginRequestEntity);

      }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print('Invalid email format');
      }
      else if (e.code == 'operation-not-allowed') {}
    }
  }


Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
  EasyLoading.show(
    indicator: CircularProgressIndicator(
      color: primary50,
    ),
    maskType: EasyLoadingMaskType.clear,
    dismissOnTap: true,
  );
  var result = await UserAPI.login(params:loginRequestEntity);
  if(result.code == 200){
  try{
     Global.storageService.setString(
        AppConstants.storageUserProfileKey, jsonEncode(result.data!));
     Global.storageService.setString(
        AppConstants.storageUserTokenKey, result.data!.access_token!);
     EasyLoading.dismiss();
     Navigator.of(context).pushNamedAndRemoveUntil("/app", (route) => false);
  }catch(e){
    print('error:${e.toString()}');
  }
}
  else{
    EasyLoading.dismiss();
    animatedSnackBar(
        'unknown error',
        AnimatedSnackBarType.error).show(context);
  }
}}