import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/create_account/bloc/signup_blocs.dart';
import 'package:untitled/screens/login/sign_in.dart';
import 'package:untitled/values/constants.dart';

class SignUpController {
  final BuildContext context;

  const SignUpController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<SignUpBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (userName.isEmpty) {
      animatedSnackBar(
          'Please enter a username',
          AnimatedSnackBarType.info).show(context);
    }
    if (email.isEmpty) {
      animatedSnackBar(
          'Email cannot be empty',
          AnimatedSnackBarType.info).show(context);

    }
    if (password.isEmpty) {
      animatedSnackBar(
          'Password cannot be empty',
          AnimatedSnackBarType.info).show(context);
    }
    if (confirmPassword.isEmpty) {
      animatedSnackBar(
          'Password confirmation cannot be empty',
          AnimatedSnackBarType.info).show(context);
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user != null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl = "${AppConstants.serverAPIUrl}uploads/images/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        animatedSnackBar(
            'A message has been sent to your registered email. Please check to verify your email address ',
            AnimatedSnackBarType.info).show(context);
        Navigator.of(context).pushNamed("/signIn");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {}
      else if (e.code == 'email-already-in-use') {
        animatedSnackBar(
            'Email already in use by another account',
            AnimatedSnackBarType.info).show(context);
      }
      else if (e.code == 'invalid-email') {}
      else if (e.code == 'operation-not-allowed') {}
    }
  }

  AnimatedSnackBar animatedSnackBar(String message, AnimatedSnackBarType type) {
    return AnimatedSnackBar.material(message, type: type,
    );
  }
}
