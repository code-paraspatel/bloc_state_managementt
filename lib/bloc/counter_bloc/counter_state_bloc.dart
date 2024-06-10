

import 'package:bloc_state_manegment/bloc/counter_bloc/counter_event_bloc.dart';
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
 final int counter;
   const CounterState({this.counter = 0});

  @override
  List<Object?> get props =>[counter];

  CounterState copyWith ({int? count}) {
    return CounterState(
      counter: count ?? counter
    );
  }

}

class CounterS extends Equatable {
  final int y ;
 const CounterS({this.y = 0});

  @override
  List<Object?> get props =>[y];

  CounterS copyWith ({int? y}){
    return CounterS(
      y: y ?? 0,
    );
  }
}