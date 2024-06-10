

import 'package:equatable/equatable.dart';

class FavouriteItemModal extends Equatable{
  final String id;
  final String name;
 final bool isDeleting ;
  final bool isFavourite;

   const FavouriteItemModal( {
    required this.id,
    required this.name,
    this.isDeleting = false,
    this.isFavourite = false
});

  FavouriteItemModal copyWith({String? id,String? name ,bool? isDeleting,bool? isFavourite}){
    return FavouriteItemModal(
        id: id ?? this.id,
        name: name ?? this.name,
        isDeleting: isDeleting ?? this.isDeleting,
      isFavourite: isFavourite ?? this.isFavourite
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,isDeleting,isFavourite];

}