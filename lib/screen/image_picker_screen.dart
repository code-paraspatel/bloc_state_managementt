import 'dart:io';

import 'package:bloc_state_manegment/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_state_manegment/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:bloc_state_manegment/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:bloc_state_manegment/screen/list_bloc_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Screen With Bloc'),
      ),
      body:   SingleChildScrollView(
        child: Center(
          child: Column(
           // verticalDirection: VerticalDirection.up,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ImagePickerBloc,ImagePickerState>(
                builder: (context, state) {
                return InkWell(
                  onTap: () {
                   context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  child : state.file == null ? const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.camera_alt_outlined),
                  ) : Image.file(File(state.file!.path.toString()))
                );
              },),
              const SizedBox(height: 20,),
              BlocBuilder<ImagePickerBloc,ImagePickerState>(
                buildWhen: (previous, current) => previous.file == current.file,
                builder: (context, state) {
                return InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                   context.read<ImagePickerBloc>().add(GalleryCapture());
                  },
                  child: state.file == null ? const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.browse_gallery_outlined)
                  ):Image.file(File(state.file!.path.toString()),fit: BoxFit.fill,)
                );
              },),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ListBlocScreen(),));
              }, child: const Text('List Bloc Screen'))
            ],
          ),
        ),
      ),
    );
  }
}
