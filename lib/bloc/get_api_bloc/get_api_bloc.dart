

import 'package:bloc/bloc.dart';
import 'package:bloc_state_manegment/bloc/get_api_bloc/get_api_event.dart';
import 'package:bloc_state_manegment/bloc/get_api_bloc/get_api_state.dart';

import '../../modal/get_api_modal.dart';
import '../../repo/get_api_repo.dart';

class GetApiBloc extends Bloc<GetApiEvent,GetApiState>{

  GetApiRepo getApiRepo = GetApiRepo();
  List<GetApiModal> tempSTList = [];
  GetApiBloc():super(const GetApiState()){
    on<GetApiList>(_getApiList);
    on<SearchList>(_searchList);
  }

  _getApiList(GetApiList event , Emitter<GetApiState>emit) async {

    await getApiRepo.getApi().then((value) {
      emit(state.copyWith(
          getApiModalList: value,
        getApiStatus: GetApiStatus.success,
        tempApiList: state.tempApiList,
        massage: ''
      ));
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
          massage: error.toString()
        )
      );
    });
  }

  _searchList(SearchList event , Emitter<GetApiState> emit){
    if(event.stText.isEmpty){
      emit(state.copyWith(tempApiList: [],stMessage: ''));
    }else {
      tempSTList = state.getApiModalList.where((element) =>
          element.email!.toLowerCase().toString().contains(
              event.stText.toLowerCase().toString())).toList();
      if(tempSTList.isEmpty){
        emit(state.copyWith(tempApiList: tempSTList,stMessage: 'Data Not Found'));
      }else{
        emit(state.copyWith(tempApiList: tempSTList,stMessage: ''));
      }
    }
  }
}