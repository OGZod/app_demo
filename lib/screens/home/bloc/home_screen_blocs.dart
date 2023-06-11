import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/home/bloc/home_screen_eventss.dart';
import 'package:untitled/screens/home/bloc/home_screen_states.dart';

class HomeScreenBlocs extends Bloc<HomeScreenEvents,HomeScreenStates>{
  HomeScreenBlocs():super(const HomeScreenStates()){
    on<HomeScreenDots>(_homeScreenDots);
  }
  void _homeScreenDots(HomeScreenDots event,Emitter<HomeScreenStates> emitter){
    emitter(state.copyWith(index:event.index));
  }
}