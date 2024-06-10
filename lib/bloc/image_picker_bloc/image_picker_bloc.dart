

import 'package:bloc/bloc.dart';
import 'package:bloc_state_manegment/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:bloc_state_manegment/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerState>{

  final ImagePickerUtils imagePickerUtils ;
  ImagePickerBloc(this.imagePickerUtils):super(const ImagePickerState()){
    on<CameraCapture>(_cameraCapture);
    on<GalleryCapture>(_galleryCapture);
  }

  _cameraCapture(CameraCapture event , Emitter<ImagePickerState> emit) async {
    final XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  _galleryCapture(GalleryCapture event , Emitter<ImagePickerState> emit) async {
    final XFile? file = await imagePickerUtils.galleryCapture();
    emit(state.copyWith(file: file));
  }
}