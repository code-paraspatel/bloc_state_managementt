


import 'package:bloc/bloc.dart';
import 'package:bloc_state_manegment/bloc/list_bloc/list_event.dart';
import 'package:bloc_state_manegment/bloc/list_bloc/list_state.dart';

class ListBloc extends Bloc<ListEvent,ListState>{

  List<String> task = [];

  ListBloc():super(const ListState()){
    on<AddValueInList>(_addValueInList);
    on<RemoveValueInLIst>(_removeValueInList);
  }

  _addValueInList(AddValueInList event , Emitter<ListState> emit){
    task.add(event.task.toString());
    emit(state.copyWith(task: List.from(task)));
  }

  _removeValueInList(RemoveValueInLIst event , Emitter<ListState> emit){
    task.remove(event.task);
    emit(state.copyWith(task: List.from(task)));
  }

}