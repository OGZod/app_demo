import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/onboarding/bloc/onboarding_events.dart';
import 'package:untitled/screens/onboarding/bloc/onboarding_states.dart';

class OnboardingBloc extends Bloc<OnboardingEvents,OnboardingStates>{
  OnboardingBloc():super(OnboardingStates()){
    on<OnboardingEvents>((event, emit) {
      emit(OnboardingStates(page: state.page));

    });
  }

}