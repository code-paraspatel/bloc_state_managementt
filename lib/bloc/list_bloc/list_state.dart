
import 'package:equatable/equatable.dart';

class ListState extends Equatable{

 final List<String> task;
   const ListState({this.task =  const []});

   ListState copyWith({List<String>? task}){
     return ListState(
       task: task ?? this.task
     );
   }

  @override
  List<Object?> get props => [task];
}