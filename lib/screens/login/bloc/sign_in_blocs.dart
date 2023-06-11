import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/login/bloc/sign_in_events.dart';
import 'package:untitled/screens/login/bloc/sign_in_states.dart';

class SignInBlocs extends Bloc<SignInEvents,SignInStates>{
  SignInBlocs():super(const SignInStates()){
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent emailEvent,Emitter<SignInStates> emailEmitter){
    emailEmitter(state.copyWith(email: emailEvent.email));
  }
  void _passwordEvent(PasswordEvent passwordEvent,Emitter<SignInStates> passwordEmitter){
    passwordEmitter(state.copyWith(password: passwordEvent.password));
  }
}