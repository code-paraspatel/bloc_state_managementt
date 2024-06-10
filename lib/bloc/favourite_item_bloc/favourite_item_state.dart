import 'package:equatable/equatable.dart';

import '../../modal/favourite_item_modal.dart';

 enum Status{loading,error,success}
class FavouriteItemState extends Equatable {

  final List<FavouriteItemModal> favouriteItemList;
  final List<FavouriteItemModal> tempItemList;
  final Status status ;
 const FavouriteItemState({
   this.favouriteItemList = const [],
   this.tempItemList = const [],
   this.status = Status.loading
});

  FavouriteItemState copyWith({List<FavouriteItemModal>? favouriteItemList,Status? status,List<FavouriteItemModal>? tempItemList}){
    return FavouriteItemState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      status: status ?? this.status,
      tempItemList: tempItemList ?? this.tempItemList
    );
  }

  @override
  List<Object?> get props => [favouriteItemList,status,tempItemList];

}