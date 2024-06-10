import 'package:bloc_state_manegment/bloc/list_bloc/list_bloc.dart';
import 'package:bloc_state_manegment/bloc/list_bloc/list_event.dart';
import 'package:bloc_state_manegment/bloc/list_bloc/list_state.dart';
import 'package:bloc_state_manegment/screen/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ListBlocScreen extends StatefulWidget {
  const ListBlocScreen({super.key});

  @override
  State<ListBlocScreen> createState() => _ListBlocScreenState();
}

class _ListBlocScreenState extends State<ListBlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List In Remove And Add Value'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyFavouriteScreen(),));
          }, icon: const Icon(Icons.favorite))
        ],
      ),
      body: BlocBuilder<ListBloc,ListState>(
        builder: (context, state) {
        if(state.task.isEmpty){
          return const Center(child: Text('No Data Found'),);
        }else if(state.task.isNotEmpty){
          return ListView.builder(
            itemCount: state.task.length,
            itemBuilder: (context, index) {
              return  ListTile(
                title: Text('${state.task[index]} : ${index + 1}'),
                trailing: InkWell(
                  onTap: () {
                  context.read<ListBloc>().add(RemoveValueInLIst(task: state.task[index]));
                  },
                    child: const Icon(Icons.delete)),
              );
            },);
        }else{
          return Container();
        }
      },),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
            context.read<ListBloc>().add(const AddValueInList(task: 'asif'));
      },),
    );
  }
}
