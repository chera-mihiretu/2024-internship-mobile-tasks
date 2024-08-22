import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:ecommerce_app/core/errors/failures/failure.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_helper/auth_test_data/testing_data.dart';
import '../../../../test_helper/test_helper_generation.mocks.dart';

void main() {
  late MockLogInUsecase mockLogInUsecase;
  late MockSignUpUsecase mockSignUpUsecase;
  late AuthBloc authBloc;

  setUp(() {
    mockLogInUsecase = MockLogInUsecase();
    mockSignUpUsecase = MockSignUpUsecase();
    authBloc = AuthBloc(
        signUpUsecase: mockSignUpUsecase, logInUsecase: mockLogInUsecase);
  });

  test('Bloc should in its iinitial point ', () {
    expect(authBloc.state, isA<AuthInitial>());
  });

  blocTest(
    'log in test',
    build: () {
      when(mockLogInUsecase.execute(any))
          .thenAnswer((_) async => const Right(true));
      return authBloc;
    },
    act: (bloc) => bloc.add(
      LogInEvent(
        email: AuthData.email,
        password: AuthData.password,
      ),
    ),
    expect: () => [
      AuthLoadingstate(),
      LogInSuccessState(),
    ],
  );

  blocTest(
    'log in test failed',
    build: () {
      when(mockLogInUsecase.execute(any)).thenAnswer((_) async =>
          Left(ServerFailure(AppData.getMessage(AppData.serverError))));
      return authBloc;
    },
    act: (bloc) => bloc.add(
      LogInEvent(
        email: AuthData.email,
        password: AuthData.password,
      ),
    ),
    expect: () => [
      AuthLoadingstate(),
      LoginErrorState(message: AppData.getMessage(AppData.serverError)),
    ],
  );

  blocTest(
    'Signup test',
    build: () {
      when(mockSignUpUsecase.execute(any))
          .thenAnswer((_) async => const Right(true));
      return authBloc;
    },
    act: (bloc) => bloc.add(
      SignUpEvent(
        name: AuthData.name,
        email: AuthData.email,
        password: AuthData.password,
      ),
    ),
    expect: () => [
      AuthLoadingstate(),
      RegisterSuccessState(),
    ],
  );

  blocTest(
    'Signup test faile',
    build: () {
      when(mockSignUpUsecase.execute(any)).thenAnswer((_) async =>
          Left(ServerFailure(AppData.getMessage(AppData.serverError))));
      return authBloc;
    },
    act: (bloc) => bloc.add(
      SignUpEvent(
        name: AuthData.name,
        email: AuthData.email,
        password: AuthData.password,
      ),
    ),
    expect: () => [
      AuthLoadingstate(),
      SignupErrorState(message: AppData.getMessage(AppData.serverError)),
    ],
  );
}
