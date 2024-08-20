// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_input_validation_state.dart';

class UserInputValidationCubit extends Cubit<UserInputValidationState> {
  UserInputValidationCubit() : super(UserInputValidationInitial());
}
