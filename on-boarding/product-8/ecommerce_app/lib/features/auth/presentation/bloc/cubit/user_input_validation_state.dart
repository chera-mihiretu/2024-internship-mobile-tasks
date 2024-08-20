part of 'user_input_validation_cubit.dart';

sealed class UserInputValidationState extends Equatable {
  const UserInputValidationState();

  @override
  List<Object> get props => [];
}

final class UserInputValidationInitial extends UserInputValidationState {}
