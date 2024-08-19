part of 'auth_bloc.dart';

// ignore: must_be_immutable
sealed class AuthState extends Equatable {
  List<Object> objects;
  AuthState([this.objects = const []]);

  @override
  List<Object> get props => [objects];
}

// ignore: must_be_immutable
final class AuthInitial extends AuthState {}

// ignore: must_be_immutable
final class AuthLoadingstate extends AuthState {}

// ignore: must_be_immutable
final class LogInSuccessState extends AuthState {}

// ignore: must_be_immutable
final class RegisterSuccessState extends AuthState {}

// ignore: must_be_immutable
final class AuthErrosState extends AuthState {
  final String message;
  AuthErrosState({required this.message}) : super([message]);
}
