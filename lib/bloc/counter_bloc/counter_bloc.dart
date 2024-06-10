import 'package:bloc/bloc.dart';
import 'package:bloc_state_manegment/bloc/counter_bloc/counter_event_bloc.dart';
import 'package:bloc_state_manegment/bloc/counter_bloc/counter_state_bloc.dart';


class CounterBloc extends Bloc<CounterEvent,CounterState>{

  CounterBloc():super(const CounterState()){
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<ResetCounter>(_resetCounter);
  }

 void _increment(IncrementCounter event , Emitter<CounterState> emit){
    emit(state.copyWith(count: state.counter + 1));
 }

 void _decrement(DecrementCounter event , Emitter<CounterState> emit){
    emit(state.copyWith(count: state.counter == 0 ? 0 : state.counter -1 ));
 }
 void _resetCounter(ResetCounter event , Emitter<CounterState> emit){
    emit(state.copyWith(count: 0));
 }
}



class CounterB extends Bloc<CounterE , CounterS>{

  CounterB() :super(const CounterS()){
    on<IncrementC>(_incrementC);
    on<DecrementC>(_decrementC);
  }

  _incrementC(IncrementC event , Emitter<CounterS> emit){
    emit(state.copyWith(y: state.y + 2));
  }

  _decrementC(DecrementC event , Emitter<CounterS> emit){
    emit(state.copyWith(y: state.y - 2));
  }
}