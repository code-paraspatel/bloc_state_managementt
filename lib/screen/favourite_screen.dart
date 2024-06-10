
import 'package:bloc_state_manegment/bloc/favourite_item_bloc/favourite_item_bloc.dart';
import 'package:bloc_state_manegment/bloc/favourite_item_bloc/favourite_item_event.dart';
import 'package:bloc_state_manegment/bloc/favourite_item_bloc/favourite_item_state.dart';
import 'package:bloc_state_manegment/modal/favourite_item_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {

  @override
  void initState() {
    context.read<FavouriteItemBloc>().add(FetchList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Screen'),
        actions: [
          BlocBuilder<FavouriteItemBloc,FavouriteItemState>(builder: (context, state) {
            return Visibility(
              visible: state.tempItemList.isNotEmpty?true:false,
              child: IconButton(
                  onPressed: () {
                context.read<FavouriteItemBloc>().add(DeleteItem());
              }, icon: const Icon(Icons.delete)),
            );
          },)
        ],
      ),
     body: Padding(
       padding: const EdgeInsets.all(15.0),
       child: BlocBuilder<FavouriteItemBloc,FavouriteItemState>(
         builder: (context, state) {
           if(state.status == Status.loading){
             return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
           }else if(state.status == Status.success){
             return ListView.builder(
               itemCount: state.favouriteItemList.length,
               itemBuilder: (context, index) {
                 final items = state.favouriteItemList[index];
                 return Card(
                   child: ListTile(
                     title: Text(items.name),
                     leading: Checkbox(
                       value: state.tempItemList.contains(items) ? true : false,
                       onChanged: (value) {
                         if(value!){
                           context.read<FavouriteItemBloc>().add(SelectItem(item: items));
                         }else{
                           context.read<FavouriteItemBloc>().add(UnSelectItem(item: items));
                         }
                       },),
                     trailing: IconButton(
                         onPressed: () {
                           FavouriteItemModal item = FavouriteItemModal(
                               id: items.id.toString(),
                               name: items.name,
                               isFavourite: items.isFavourite ? false : true,
                           );
                          context.read<FavouriteItemBloc>().add(ToggleFavouriteButton(item: item));
                     }, icon:  Icon(
                         items.isFavourite ?Icons.favorite:Icons.favorite_border)),
                   ),
                 );
               },);
           }else {
             return const SizedBox();
           }

       },),
     ),
    );
  }
}
