import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures/failure.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LogInEvent>((event, emit) async {
      emit(AuthLoadingstate());
      UserEntity myEnity =
          UserEntity(name: '', email: event.email, password: event.password);
      final result = await repository.logIn(myEnity);
      result.fold((failure) {
        emit(AuthErrosState(message: failure.message));
      }, (data) {
        emit(LogInSuccessState());
      });
    });
    on<SignUpEvent>((event, emit) async {
      UserEntity myEnity = UserEntity(
          name: event.name, email: event.email, password: event.password);
      final result = await repository.signUp(myEnity);
      result.fold((failure) {
        emit(AuthErrosState(message: failure.message));
      }, (data) {
        emit(RegisterSuccessState());
      });
    });
  }
}
