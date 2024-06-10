
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {

  const CounterEvent();

  @override
  List<Object> get props => [];

}

class IncrementCounter extends CounterEvent{}

class DecrementCounter extends CounterEvent{}
class ResetCounter extends CounterEvent{}


abstract class CounterE extends Equatable {
  const CounterE();
  @override
  List<Object> get props => [];
}

class IncrementC extends CounterE {}
class DecrementC extends CounterE {}