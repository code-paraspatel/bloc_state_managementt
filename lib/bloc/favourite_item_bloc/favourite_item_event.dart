import 'package:bloc_state_manegment/modal/favourite_item_modal.dart';
import 'package:equatable/equatable.dart';



abstract class FavouriteItemEvent extends Equatable{


  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchList extends FavouriteItemEvent{}

class ToggleFavouriteButton extends FavouriteItemEvent {
 final   FavouriteItemModal item;
  ToggleFavouriteButton({required this.item});
}

class SelectItem extends FavouriteItemEvent{
  final FavouriteItemModal item;
  SelectItem({required this.item});
}

class UnSelectItem extends FavouriteItemEvent{
  final FavouriteItemModal item;
  UnSelectItem({required this.item});
}

class DeleteItem extends FavouriteItemEvent{}