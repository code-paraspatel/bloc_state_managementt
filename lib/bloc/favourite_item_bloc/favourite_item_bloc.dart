
import 'package:bloc/bloc.dart';
import 'package:bloc_state_manegment/bloc/favourite_item_bloc/favourite_item_event.dart';
import 'package:bloc_state_manegment/bloc/favourite_item_bloc/favourite_item_state.dart';
import 'package:bloc_state_manegment/modal/favourite_item_modal.dart';

import '../../repo/favourite_item_repo.dart';

class FavouriteItemBloc extends Bloc<FavouriteItemEvent,FavouriteItemState>{
  final FavouriteItemRepo favouriteItemRepo ;


  List<FavouriteItemModal> favItemList = [];
  List<FavouriteItemModal> tempItemList = [];

  FavouriteItemBloc(this.favouriteItemRepo):super(const FavouriteItemState()){
    on<FetchList>(_fetchList);
    on<ToggleFavouriteButton>(_toggleFavouriteButton);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  _fetchList(FetchList event , Emitter<FavouriteItemState> emit) async{
    favItemList = await favouriteItemRepo.getFavouriteList();
    emit(state.copyWith(
        favouriteItemList: List.from(favItemList),
        status:  Status.success
    ));
  }

  _toggleFavouriteButton(ToggleFavouriteButton event ,Emitter<FavouriteItemState> emit){
     final index = favItemList.indexWhere((element) => element.id == event.item.id);

     if(event.item.isFavourite){
       if(tempItemList.contains(favItemList[index])){
         tempItemList.remove(favItemList[index]);
         tempItemList.add(event.item);
       }
     }else{
      if(tempItemList.contains(favItemList[index])){
        tempItemList.remove(favItemList[index]);
        tempItemList.add(event.item);
      }
     }
     favItemList[index]= event.item;
    emit(state.copyWith(
      favouriteItemList: List.from(favItemList),
      tempItemList: List.from(tempItemList)
    ));
  }

  _selectItem(SelectItem event , Emitter<FavouriteItemState> emit){
    tempItemList.add(event.item);
    emit(state.copyWith(tempItemList: List.from(tempItemList)));
  }

  _unSelectItem(UnSelectItem event , Emitter<FavouriteItemState> emit){
    tempItemList.remove(event.item);
    emit(state.copyWith(tempItemList: List.from(tempItemList)));
  }

  _deleteItem(DeleteItem event , Emitter<FavouriteItemState> emit){
    for(int i=0;i<tempItemList.length;i++){
      favItemList.remove(tempItemList[i]);
    }
    tempItemList.clear();
    emit(state.copyWith(
         favouriteItemList: List.from(favItemList),
        tempItemList: List.from(tempItemList)));
  }
}