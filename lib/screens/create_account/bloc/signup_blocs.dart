import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/create_account/bloc/signup_events.dart';
import 'package:untitled/screens/create_account/bloc/signup_states.dart';

class SignUpBlocs extends Bloc<SignUpEvents, SignUpStates> {
  SignUpBlocs() : super(const SignUpStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  void _userNameEvent(UserNameEvent userNameEvent,
      Emitter<SignUpStates> userNameEmitter) {
    userNameEmitter(state.copyWith(userName: userNameEvent.userName));
  }

  void _emailEvent(EmailEvent emailEvent, Emitter<SignUpStates> emailEmitter) {
    emailEmitter(state.copyWith(email: emailEvent.email));
  }

  void _passwordEvent(PasswordEvent passwordEvent,
      Emitter<SignUpStates> passwordEmitter) {
    passwordEmitter(state.copyWith(password: passwordEvent.password));
  }

  void _confirmPasswordEvent(ConfirmPasswordEvent confirmPasswordEvent,
      Emitter<SignUpStates> confirmPasswordEmitter) {
    confirmPasswordEmitter(
        state.copyWith(confirmPassword: confirmPasswordEvent.confirmPassword));
  }
}
