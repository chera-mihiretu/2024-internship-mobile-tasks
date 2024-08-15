import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());
}
