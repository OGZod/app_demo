import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/app_events.dart';
import 'package:untitled/app_state.dart';

class AppBlocs extends Bloc<AppEvents,AppStates>{
  AppBlocs():super(InitStates()){
    on<Increment>((event, plus1){
      plus1(AppStates(counter: state.counter+1));
    });
    on<Decrement>((event, minus1){
      minus1(AppStates(counter: state.counter-1));
    });
  }

}