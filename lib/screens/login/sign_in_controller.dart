import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/global.dart';
import 'package:untitled/screens/login/bloc/sign_in_blocs.dart';
import 'package:untitled/values/constants.dart';

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
          AnimatedSnackBarType.info).show(context);
    }

    if(password.isEmpty){
      animatedSnackBar(
          "Password cannot be empty" ,
          AnimatedSnackBarType.info).show(context);

    }

    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      if(credential.user==null){}
      if(!credential.user!.emailVerified){
        print('user has not verified email');
        animatedSnackBar(
            'Please verify your email first...',
            AnimatedSnackBarType.info).show(context);
      }
      var user = credential.user;
      if(user!=null && credential.user?.emailVerified == true){
        print('user exist and is verified');
        Global.storageService.setString(
            AppConstants.storageUserTokenKey, '1234');
        Navigator.of(context).pushNamedAndRemoveUntil("/app", (route) => false);
      }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print('Invalid email format');
      }
      else if (e.code == 'operation-not-allowed') {}
    }
  }
  AnimatedSnackBar animatedSnackBar(String message, AnimatedSnackBarType type) {
    return AnimatedSnackBar.material(message, type: type,
    );
  }
}