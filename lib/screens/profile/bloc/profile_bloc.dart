import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/profile/bloc/profile_events.dart';
import 'package:untitled/screens/profile/bloc/profile_states.dart';

class ProfileBlocs extends Bloc<ProfileEvents,ProfileStates>{
  ProfileBlocs(): super(ProfileStates()){
  on<TriggerProfile>((event,emit){
    emit(ProfileStates());
  });
  }

}