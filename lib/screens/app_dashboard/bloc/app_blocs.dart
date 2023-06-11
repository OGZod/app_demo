import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_events.dart';
import 'app_state.dart';

class AppBlocs extends Bloc<AppEvents,AppStates>{
  AppBlocs():super(const AppStates()){
    on<TriggerAppEvent>((event, emit) {
      emit(AppStates(index: event.index));
    });
  }

}