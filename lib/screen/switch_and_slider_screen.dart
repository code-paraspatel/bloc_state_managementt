import 'package:bloc_state_manegment/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_state_manegment/bloc/switch_bloc/switch_event.dart';
import 'package:bloc_state_manegment/bloc/switch_bloc/switch_state.dart';
import 'package:bloc_state_manegment/screen/image_picker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SwitchSliderScreen extends StatefulWidget {
  const SwitchSliderScreen({super.key});

  @override
  State<SwitchSliderScreen> createState() => _SwitchSliderScreenState();
}

class _SwitchSliderScreenState extends State<SwitchSliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch and Slider '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SwitchBloc,SwitchState>(
            buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
            builder: (context, state) {
           return SwitchListTile(
             title: const Text('Notification Switch'),
             value: state.isSwitch,
             onChanged: (value) {
               context.read<SwitchBloc>().add(SwitchEnableDisable());
           },);
          },),

          const SizedBox(height: 20,),
         BlocBuilder<SwitchBloc,SwitchState>(
           buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
           builder: (context, state) {
           return  Container(
             height: 100,
             width: 500,
             color: Colors.red.withOpacity(state.sliderValue),
           );
         },),
          const SizedBox(height: 20,),

          BlocBuilder<SwitchBloc , SwitchState>(
            buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder:(context, state) {
                return Slider(value: state.sliderValue,
                  onChanged: (value) {
                  context.read<SwitchBloc>().add(SliderScroll(sliderValue: value));
                },);
              }, ),


          ElevatedButton(onPressed: () {

            Navigator.push(context, MaterialPageRoute(builder: (context) => const ImagePickerScreen(),));
          }, child: const Text('Image Picker Screen'))

        ],
      ),
    );
  }
}
