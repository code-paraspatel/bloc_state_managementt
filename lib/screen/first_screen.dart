import 'package:bloc_state_manegment/screen/counter_screen.dart';
import 'package:bloc_state_manegment/screen/favourite_screen.dart';
import 'package:bloc_state_manegment/screen/get_api_screen.dart';
import 'package:bloc_state_manegment/screen/image_picker_screen.dart';
import 'package:bloc_state_manegment/screen/list_bloc_screen.dart';
import 'package:bloc_state_manegment/screen/login_api_screen.dart';
import 'package:bloc_state_manegment/screen/switch_and_slider_screen.dart';
import 'package:flutter/material.dart';

class MyFirstScreen extends StatefulWidget {
  const MyFirstScreen({super.key});

  @override
  State<MyFirstScreen> createState() => _MyFirstScreenState();
}

class _MyFirstScreenState extends State<MyFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //counter screen
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterScreen(),));
              }, child: const Text('Counter Screen')),
               // Swich and Slider screen
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SwitchSliderScreen(),));
              }, child: const Text('Switch And Slider Screen')),

              // ImagePiker Screen
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ImagePickerScreen(),));
              }, child: const Text('Image Picker Screen')),

              // List Bloc Screen
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ListBlocScreen(),));
              }, child: const Text('List Bloc Screen')),

              //favorite screen
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyFavouriteScreen(),));
              }, child: const Text('Favorite  Screen')),

              // get Api Screen
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const GetApiScreen(),));
              }, child: const Text('Get Api Screen')),

              // Login Api Screen
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginApiScreen(),));
              }, child: const Text('Login Api Screen'))


            ],
          ),
        ),
      ),
    );
  }
}
