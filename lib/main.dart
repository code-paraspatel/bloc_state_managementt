import 'package:bloc_state_manegment/bloc/favourite_item_bloc/favourite_item_bloc.dart';
import 'package:bloc_state_manegment/bloc/get_api_bloc/get_api_bloc.dart';
import 'package:bloc_state_manegment/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_state_manegment/bloc/list_bloc/list_bloc.dart';
import 'package:bloc_state_manegment/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_state_manegment/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_state_manegment/repo/favourite_item_repo.dart';
import 'package:bloc_state_manegment/screen/first_screen.dart';
import 'package:bloc_state_manegment/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:
        [
          BlocProvider(create: (_)=>SwitchBloc()),
          BlocProvider(create: (_)=>ImagePickerBloc(ImagePickerUtils())),
          BlocProvider(create: (_)=>ListBloc()),
          BlocProvider(create: (_)=>FavouriteItemBloc(FavouriteItemRepo())),
          BlocProvider(create: (_)=>GetApiBloc()),
          BlocProvider(create: (_)=>LoginBloc()),
        ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyFirstScreen(),
    ),
    );
  }
}

