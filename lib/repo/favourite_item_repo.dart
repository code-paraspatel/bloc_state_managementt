

import 'package:bloc_state_manegment/modal/favourite_item_modal.dart';

class FavouriteItemRepo {


  Future<List<FavouriteItemModal>> getFavouriteList ()async{
      await Future.delayed(const Duration(seconds: 3));
     return List.of(createList(10));
  }

  List<FavouriteItemModal> createList (int index){
    return List.generate(index, (index) => FavouriteItemModal(id: index.toString(), name: 'paras: $index'));
  }
}