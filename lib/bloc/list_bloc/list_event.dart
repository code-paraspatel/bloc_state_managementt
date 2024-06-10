import 'package:equatable/equatable.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object?> get props => [];

}

class AddValueInList extends ListEvent {

 final Object task;
  const AddValueInList({required this.task});
  @override
  List<Object?> get props => [task];

}

class RemoveValueInLIst extends ListEvent{
  final Object task;
  const RemoveValueInLIst({required this.task});

  @override
  List<Object?> get props => [task];
}