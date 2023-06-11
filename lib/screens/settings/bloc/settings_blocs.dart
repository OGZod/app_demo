import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/settings/bloc/settings_events.dart';
import 'package:untitled/screens/settings/bloc/settings_states.dart';
import 'package:untitled/screens/settings/settings_screen.dart';

class SettingsBlocs extends Bloc<SettingsEvents,SettingsStates>{
  SettingsBlocs(): super(SettingsStates()){
    on<TriggerSettings>((event, emit) => SettingsStates());
  }

}