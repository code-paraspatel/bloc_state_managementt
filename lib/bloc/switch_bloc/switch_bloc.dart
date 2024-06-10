import 'package:bloc/bloc.dart';
import 'package:bloc_state_manegment/bloc/switch_bloc/switch_event.dart';
import 'package:bloc_state_manegment/bloc/switch_bloc/switch_state.dart';


class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc():super(const SwitchState()){
   on<SwitchEnableDisable>(_switchToggle);
   on<SliderScroll>(_sliderScroll);
  }

  _switchToggle(SwitchEnableDisable event , Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  _sliderScroll(SliderScroll event , Emitter<SwitchState> emit){
    emit(state.copyWith(sliderValue: event.sliderValue));
  }

}